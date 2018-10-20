#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Compact given CSV to binary format.

Usage:
    pack.py <csv>

Options:
    -h --help   Show help message
"""

from struct import Struct, unpack_from, pack, calcsize, unpack
import bz2
import collections
import csv
import math
import os
import os.path
import re

import docopt
import tqdm


IS_INT = re.compile(r"[0-9]+")
IS_FLOAT = re.compile(r"[0-9e.-]+")

PRECISION = {
    # Integers
    "b": 1,
    "B": 1,
    "h": 2,
    "H": 2,
    "i": 4,
    "I": 4,
    "q": 8,
    "Q": 8,
    # Floats
    "e": 2,
    "f": 4,
    "d": 8,
}


def get_minimal_int_type(value):
    is_negative = value < 0
    positive_value = abs(value)

    # Check 8 bits
    if positive_value < 128:
        return "b" if is_negative else "B"

    # Check 16 bits
    if positive_value < 32768:
        return "h" if is_negative else "H"

    # Check 32 bits
    if positive_value < 2_147_483_648:
        return "i" if is_negative else "I"

    # Fallback to 32 bits
    return "q" if is_negative else "Q"


def get_minimal_float_type(value):
    # Check 16 bits
    try:
        f = ">e"
        if math.isclose(value, unpack(f, pack(f, value))[0], abs_tol=1e-9):
            return "e"
    except OverflowError:
        pass

    # Check 32 bits
    f = ">f"
    if math.isclose(value, unpack(f, pack(f, value))[0], abs_tol=1e-9):
        return "f"

    # Fallback to 64 bits
    return "d"


def guess_type(value):
    if IS_INT.fullmatch(value) is not None:
        try:
            int_value = int(value)
            return get_minimal_int_type(int_value), int_value
        except ValueError:
            pass
    elif IS_FLOAT.fullmatch(value) is not None:
        try:
            float_value = float(value)
            return get_minimal_float_type(float_value), float_value
        except ValueError:
            pass

    return "s", value


def iter_rows(csvpath):
    headers = None
    for root, _, files in os.walk("."):
        for f in files:
            if f == csvpath:
                full_path = os.path.join(root, f)
                print("> Reading", full_path)
                with open(full_path) as csvfile:
                    csvreader = iter(csv.reader(csvfile, delimiter=","))
                    new_headers = next(csvreader)
                    if headers is not None and headers != new_headers:
                        print(
                            f"Inconsistent headers {headers} vs. {new_headers}: ignoring {full_path}"
                        )
                    if headers is None:
                        yield new_headers

                    headers = new_headers

                    yield from csvreader


class ByteView:
    def __init__(self, buffer=b""):
        self.buffer = buffer
        self.offset = 0

    def get_string(self, length):
        return self.get(f"{length}s")[0]

    def get(self, f):
        format_string = f">{f}"
        value = unpack_from(format_string, self.buffer, offset=self.offset)
        self.offset += calcsize(format_string)
        return value

    def set_string(self, string):
        self.set(
            f"{len(string)}s", string if isinstance(string, bytes) else string.encode()
        )

    def set(self, f, *values):
        format_string = f">{f}"
        self.buffer += Struct(format_string).pack(*values)


def unpack_rows(buffer):
    view = ByteView(buffer)

    # Unpack fields
    number_of_fields = view.get("I")[0]
    fields = []
    for _ in range(number_of_fields):
        field_size = view.get("I")[0]
        field = view.get_string(field_size).decode()
        fields.append(field)

    yield fields

    # Unpack format_string for rows
    format_string_size = view.get("I")[0]
    format_string = view.get_string(format_string_size).decode()[1:]

    # Unpack symbols tables
    number_of_tables = view.get("I")[0]
    symbols = collections.defaultdict(dict)
    for _ in range(number_of_tables):
        header_index = view.get("I")[0]
        table_size = view.get("I")[0]
        for i in range(table_size):
            symbol_size = view.get("I")[0]
            symbols[header_index][i] = view.get_string(symbol_size).decode()

    number_of_rows = view.get("I")[0]
    for _ in range(number_of_rows):
        row = list(view.get(format_string))
        for header_index, table in symbols.items():
            row[header_index] = table[row[header_index]]
        yield tuple(map(str, row))


def pack_rows(headers, rows):
    # Find best type for each field, try to find the smallest type possible for each.
    symbols = collections.defaultdict(dict)
    types = [None] * len(headers)
    converted_rows = []
    for row in rows:
        converted_row = []
        for i, value in enumerate(row):
            field_type, value = guess_type(value)

            if field_type == "s":
                # Update symbols table for values of type string
                field_symbols = symbols[i]
                if value not in field_symbols:
                    field_symbols[value] = len(field_symbols)
                types[i] = "s"
                converted_row.append(field_symbols[value])
            else:
                converted_row.append(value)
                if types[i] is None:
                    types[i] = field_type
                elif types[i] != field_type:
                    # Upgrade to bigger type if needed
                    if PRECISION[types[i]] < PRECISION[field_type]:
                        types[i] = field_type
                    elif PRECISION[types[i]] == PRECISION[field_type]:
                        print("CONFLICT", headers[i], value, types[i], field_type)

        converted_rows.append(converted_row)

    # Get minimal integer type which can fit all the symbols for this table
    for field_index, table in symbols.items():
        types[field_index] = get_minimal_int_type(len(table))

    # Create struct format
    pack_format = f'>{"".join(types)}'

    # Serialize rows given the global type found by analyzing all rows
    struct = Struct(pack_format)
    for row in converted_rows:
        yield struct.pack(*row)

    # Create metadata for this CSV file
    view = ByteView()

    # Encode headers
    view.set("I", len(headers))
    for header in headers:
        view.set("I", len(header))
        view.set_string(header)

    # Encode struct format
    view.set("I", len(struct.format))
    view.set_string(struct.format)

    # Encode symbols
    number_of_tables = len(symbols)
    view.set("I", number_of_tables)
    for header_index, table in symbols.items():
        view.set("I", header_index)
        view.set("I", len(table))
        for value in table:
            view.set("I", len(value))
            view.set_string(value)

    view.set("I", len(rows))

    yield view.buffer


def main():
    args = docopt.docopt(__doc__)
    rows_iterator = iter_rows(args["<csv>"])

    print("ENCODE")
    chunks = list(
        tqdm.tqdm(pack_rows(headers=next(rows_iterator), rows=list(rows_iterator)))
    )
    compacted = chunks[-1] + b"".join(chunks[:-1])

    print("DECODE")
    with open(f'{args["<csv>"]}.unpacked.csv', "w") as output:
        csvwriter = csv.writer(output, delimiter=",", quoting=csv.QUOTE_MINIMAL)
        for row in tqdm.tqdm(unpack_rows(compacted)):
            csvwriter.writerow(row)

    output_path = f'{args["<csv>"]}.pack.bz2'
    with bz2.open(output_path, "wb") as output:
        output.write(compacted)

    print(f"Compacted length is {len(compacted)} bytes (output: {output_path})")


if __name__ == "__main__":
    main()

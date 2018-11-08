class ByteView {
  constructor(buffer) {
    this.buffer = buffer;
    this.view = new DataView(buffer.buffer);
    this.pos = 0;
  }

  getFloat32() {
    const float = this.view.getFloat32(this.pos);
    this.pos += 4;
    return float;
  }

  getFloat64() {
    const float = this.view.getFloat64(this.pos);
    this.pos += 8;
    return float;
  }

  getBytes(n) {
    const bytes = this.buffer.subarray(this.pos, this.pos + n);
    this.pos += n;
    return bytes;
  }

  getByte() {
    return this.getUint8();
  }

  getUint8() {
    const uint8 = this.view.getUint8(this.pos);
    this.pos += 1;
    return uint8;
  }

  getInt8() {
    const int8 = this.view.getInt8(this.pos);
    this.pos += 1;
    return int8;
  }

  getUint16() {
    const uint16 = this.view.getUint16(this.pos);
    this.pos += 2;
    return uint16;
  }

  getInt16() {
    const int16 = this.view.getInt16(this.pos);
    this.pos += 2;
    return int16;
  }

  getUint32() {
    const uint32 = this.view.getUint32(this.pos);
    this.pos += 4;
    return uint32;
  }

  getInt32() {
    const int32 = this.view.getInt32(this.pos);
    this.pos += 4;
    return int32;
  }
}

// https://graphics.stanford.edu/~seander/bithacks.html#RoundUpPowerOf2
function nextPow2(_v) {
  let v = _v | 0;
  v -= 1;
  v |= v >> 1;
  v |= v >> 2;
  v |= v >> 4;
  v |= v >> 8;
  v |= v >> 16;
  v += 1;
  return v;
}

const FORMAT_CHARS = {
  x: 1,
  c: 1,
  b: 1,
  B: 1,
  "?": 1,
  h: 2,
  H: 2,
  i: 4,
  I: 4,
  l: 4,
  L: 4,
  q: 8,
  Q: 8,
  e: 2,
  f: 4,
  d: 8
};

const SEARCHABLE_FIELDS = new Set([
  "category",
  "company",
  "country",
  "host_tld",
  "month",
  "site",
  "tracker"
]);

function sizeOfFormat(format) {
  let size = 0;
  for (let i = 0; i < format.length; i += 1) {
    const numberOfBytes = FORMAT_CHARS[format[i]];
    if (numberOfBytes === undefined) {
      throw new Error(`Invalid format character ${format[i]}`);
    }
    size += numberOfBytes;
  }
  return size;
}

/* eslint-enable no-bitwise */

class Table {
  constructor(name) {
    this.name = name;
    this.dataTable = null;
    this.totalRows = 0;

    // Callback used to request more data from lazy loader
    this.onRequestMoreRows = () => {};
  }

  update(headers, data) {
    if (this.dataTable === null) {
      this.dataTable = $(`#${this.name}`).DataTable({
        colReorder: true,
        columns: headers.map(h => ({
          title: h,
          className: 'order-columns',
          searchable: SEARCHABLE_FIELDS.has(h)
        })),
        scrollX: true,
        deferRender: true,
        processing: true,
        search: false,
        pagingType: "full_numbers",
        pageLength: 25,
        display: true,
        compact: true,
        columnDefs: [
          {
              targets: -1,
              className: 'dt-body-right'
          }
        ]
      });

      // When clicking on a row, open page on WTM's website
      // $(`#${this.name} tbody`).on("click", "tr", function() {
      //   var target = dataTable.row(this).data()[2];
      //   let url;
      //   if (name === "trackers") {
      //     url = `https://whotracks.me/trackers/${target}.html`;
      //   } else if (name === "sites") {
      //     url = `https://whotracks.me/websites/${target}.html`;
      //   }

      //   if (url !== undefined) {
      //     window.open(url, "_blank");
      //   }
      // });
    }

    this.totalRows += data.length;
    this.dataTable.rows.add(data);
    this.dataTable.draw("full-hold");

    if (this.totalRows < 10000000) {
      return this.onRequestMoreRows();
    }
  }
}

class LazyCSVReader {
  constructor(url) {
    this.url = url;
    this.offset = 0;

    // Initial chunkSize, which should be pretty small to allow for fast first print.
    this.chunkSize = 32768;

    this.fetchedRows = 0;

    this.metadataSize = null;
    this.numberOfRows = null;
    this.headers = null;
    this.symbols = null;
    this.formatString = null;
    this.formatSize = null;

    this.partial = new Uint8Array();
    this.ondata = () => {};
  }

  decodeMetadataSize(view) {
    if (this.metadataSize === null) {
      this.metadataSize = view.getUint32();

      // We make sure that the next request we make can contain all the metadata
      this.chunkSize = nextPow2(this.metadataSize);
    }
  }

  decodeHeaders(view) {
    if (this.headers === null) {
      const numberOfHeaders = view.getUint32();
      const headers = [];
      for (let i = 0; i < numberOfHeaders; i += 1) {
        const headerSize = view.getUint32();
        headers.push(
          String.fromCharCode.apply(null, view.getBytes(headerSize))
        );
      }
      this.headers = headers;
    }
  }

  decodeFormatString(view) {
    if (this.formatString === null) {
      const formatStringSize = view.getUint32();
      const formatString = String.fromCharCode
        .apply(null, view.getBytes(formatStringSize))
        .slice(1);
      const formatSize = sizeOfFormat(formatString);

      this.formatString = formatString;
      this.formatSize = formatSize;
    }
  }

  decodeSymbols(view) {
    if (this.symbols === null) {
      const symbols = new Map();
      const numberOfTables = view.getUint32();
      for (let i = 0; i < numberOfTables; i += 1) {
        const headerIndex = view.getUint32();
        const tableSize = view.getUint32();
        for (let j = 0; j < tableSize; j += 1) {
          const symbolSize = view.getUint32();
          if (!symbols.has(headerIndex)) {
            symbols.set(headerIndex, new Map());
          }
          symbols
            .get(headerIndex)
            .set(j, String.fromCharCode.apply(null, view.getBytes(symbolSize)));
        }
      }

      this.symbols = symbols;
    }
  }

  decodeNumberOfRows(view) {
    if (this.numberOfRows === null) {
      this.numberOfRows = view.getUint32();
    }
  }

  decodeRows(view) {
    const remainingBytes = view.buffer.byteLength - view.pos;
    const numberOfRows = Math.floor(remainingBytes / this.formatSize);
    const rows = [];
    for (let i = 0; i < numberOfRows; i += 1) {
      const row = [];
      for (let j = 0, len = this.formatString.length; j < len; j += 1) {
        switch (this.formatString[j]) {
          case "c": {
            row.push(view.getByte());
            break;
          }
          case "b": {
            row.push(view.getInt8());
            break;
          }
          case "B": {
            row.push(view.getUint8());
            break;
          }
          case "h": {
            row.push(view.getInt16());
            break;
          }
          case "H": {
            row.push(view.getUint16());
            break;
          }
          case "i": {
            row.push(view.getInt32());
            break;
          }
          case "I": {
            row.push(view.getUint32());
            break;
          }
          case "f": {
            row.push(view.getFloat32());
            break;
          }
          case "d": {
            row.push(view.getFloat64());
            break;
          }
          default: {
            throw new Error(`Did not expect defaults: ${this.formatString[j]}`);
          }
        }
      }

      // Replace symbols by their values
      this.symbols.forEach((table, headerIndex) => {
        row[headerIndex] = table.get(row[headerIndex]);
      });

      rows.push(row);
    }

    this.partial = view.buffer.subarray(view.pos);
    this.fetchedRows += rows.length;

    // As soon as we loaded more than 100 rows (which is the maximum page size
    // for a DataTable), we increase the chunkSize to allow loading of more rows
    // at a time, in the background.
    if (this.fetchedRows > 100) {
      this.chunkSize = 2097152;
    }

    return rows;
  }

  async fetchNext() {
    if (this.fetchedRows === this.numberOfRows) {
      return;
    }

    const response = await fetch(this.url, {
      headers: {
        Range: `bytes=${this.offset}-${this.offset + this.chunkSize - 1}`
      }
    });

    if (response.ok) {
      let responseBuffer = new Uint8Array(await response.arrayBuffer());
      this.offset += responseBuffer.byteLength;
      const bytes = new Uint8Array(
        this.partial.byteLength + responseBuffer.byteLength
      );
      bytes.set(this.partial, 0);
      bytes.set(responseBuffer, this.partial.byteLength);

      const view = new ByteView(bytes);

      let beforeOffset = 0;
      try {
        this.decodeMetadataSize(view);

        beforeOffset = view.pos;
        this.decodeHeaders(view);

        beforeOffset = view.pos;
        this.decodeFormatString(view);

        beforeOffset = view.pos;
        this.decodeSymbols(view);

        beforeOffset = view.pos;
        this.decodeNumberOfRows(view);
      } catch (ex) {
        this.partial = view.buffer.subarray(beforeOffset);
        return this.fetchNext();
      }

      // this.decodeRows(view);
      return this.ondata(this.decodeRows(view));
    }
  }
}

window.onload = async () => {
  ["trackers", "sites", "companies", "sites_trackers"].forEach(
    type => {
      const table = new Table(type);
      const loader = new LazyCSVReader(
        `${window.location.origin}/data/packed/${type}.pack`
      );

      table.onRequestMoreRows = () => loader.fetchNext();
      loader.ondata = data => table.update(loader.headers, data);

      if ($(`#${type}`).is(":visible")) {
        // Start loading for visible table
        loader.fetchNext();
      } else {
        // Start loading whenever the tab is clicked
        $(`#li-${type}`).click(() => {
          loader.fetchNext();
          $(`#li-${type}`).off();
        });
      }
    }
  );
};

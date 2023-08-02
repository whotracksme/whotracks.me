#!/bin/bash
#
# Downloads the latest trackerdb release (from https://github.com/ghostery/trackerdb),
# and updates "whotracksme/data/assets/trackerdb.sql".

# make sure we are in the directory which contains the script
cd "${BASH_SOURCE%/*}"

latest_release=$(curl -s -I https://github.com/ghostery/trackerdb/releases/latest | awk '/^location/ { print $2 }' | tr -d '\r')
if [[ $latest_release =~ ^https:\/\/github\.com\/ghostery\/trackerdb\/releases\/tag\/[0-9]+$ ]]; then
    echo "Latest release found: $latest_release"
else
    echo "ERROR: Failed to find the latest release."
    exit 1
fi

version="${latest_release##*/}"
trackerdb_link="https://github.com/ghostery/trackerdb/releases/download/${version}/trackerdb.db"

tmp=$(mktemp)
tmp2=$(mktemp)
cleanup() {
    rm -f "$tmp"
    rm -f "$tmp2"
}
trap cleanup EXIT

echo "Downloading file from: ${trackerdb_link}"
curl -s -L -o "$tmp" "$trackerdb_link"

target=whotracksme/data/assets/trackerdb.sql
sqlite3 "$tmp" .dump > "$tmp2"
(echo "-- Generated from $trackerdb_link" ; cat "$tmp2") > "$target"
echo "trackerdb.sql was successfully generated: $target"

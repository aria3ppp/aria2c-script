#!/bin/bash

set -Eefuvx

PARENT_PATH="$(dirname "$(dirname "$(realpath -s "$0")")")"

function download {
  local FILES=("$@")

  for FILE in "${FILES[@]}"; do
    command aria2c --always-resume --conditional-get --allow-overwrite \
      --dir="$PARENT_PATH" \
      --out=download_outfile_name \
      "$FILE"
  done
}

download https://download-server.com/file1.mkv https://download-server-2.com/file2.mkv https://download-server-3.com/file3.mkv

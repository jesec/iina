#!/bin/bash
location="https://github.com/jesec/homebrew-mpv-iina/releases/latest/download"
IFS=$'\n' read -r -d '' -a files < <(curl -L "${location}/filelist.txt" && printf '\0')
rm -rf deps/lib
mkdir -p deps/lib
for file in "${files[@]}"
do
  set -x
  curl -L "${location}/${file}" -o deps/lib/$file
  { set +x; } 2>/dev/null
done

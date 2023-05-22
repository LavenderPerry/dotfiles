#!/bin/sh

ADBLOCK_DIR="$HOME/.local/share/luakit/adblock"

mkdir -p "$ADBLOCK_DIR"

i=0
for filter_url in \
  "https://easylist.to/easylist/easylist.txt" \
  "https://easylist.to/easylist/easyprivacy.txt" \
  "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
do
  curl "$filter_url" -o "$ADBLOCK_DIR/$i.txt"
  i=$((i + 1))
done

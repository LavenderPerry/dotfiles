#!/usr/bin/env bash

# Inspired by https://yarmo.eu/blog/playerctl-polybar/

# Truncates a variable to a length, adds ellipsis at the end
# $1 - variable to truncate
# $2 - length
trunc() {
  eval "$1=\${$1:0:$2}..."
}

case $(playerctl status 2> /dev/null) in
  "Playing")
    action="pause"
    icon="󰏤"
    ;;
  "Paused")
    action="play"
    icon="󰐊"
    ;;
  *)
    echo ""
    exit
    ;;
esac

max_title_artist_len=80

title=$(playerctl metadata title)
artist=$(playerctl metadata artist)
title_len=${#title}
artist_len=${#artist}

if [ $((title_len + artist_len)) -gt $max_title_artist_len ]; then
  max_no_ellipsis=$((max_title_artist_len - 6))
  max_artist_len=$((max_no_ellipsis / 3))
  if [ "$artist_len" -gt $((max_artist_len + 3)) ]; then
    trunc artist $max_artist_len
    max_title_len=$((max_no_ellipsis - max_artist_len + (max_no_ellipsis % 3)))
    [ "$title_len" -gt $((max_title_len + 3)) ] && trunc title "$max_title_len"
  else
    trunc title $((max_title_artist_len - artist_len - 3))
  fi
fi

echo "%{A1:playerctl $action:}$icon $title - $artist%{A}"

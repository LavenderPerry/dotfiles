#!/usr/bin/bash

SPECIFIED_PKGS=$(cat ~/.config/packages/*)

pkg_specified() {
  for specified_pkg in $SPECIFIED_PKGS; do
    [[ "$1" = "$specified_pkg" ]] && return 0
  done
  return 1
}

pkgs_to_remove() {
  for installed_pkg in $(pacman -Qeq); do
    pkg_specified "$installed_pkg" || echo "$installed_pkg"
  done
  pacman -Qdtq
}

remove_pkgs_txt=$(pkgs_to_remove)
if [ -n "$remove_pkgs_txt" ]; then
  printf "Packages to remove:\n%s\n" "$remove_pkgs_txt"
  read -rp "Remove them? [Y/n] " answer
  if [ "$answer" != "n" ]; then
    readarray -t remove_pkgs < <(pkgs_to_remove)
    sudo pacman -Rsn "${remove_pkgs[@]}"
  fi
fi

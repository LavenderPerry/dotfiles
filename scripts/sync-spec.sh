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

readarray -t remove_pkgs < <(pkgs_to_remove)
sudo pacman -Rsn "${remove_pkgs[@]}"

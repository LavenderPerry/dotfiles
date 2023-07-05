#!/usr/bin/bash

SPECIFIED_PKGS=$(cat ~/.config/packages/*)

pkg_specified() {
  for specified_pkg in $SPECIFIED_PKGS; do
    [[ "$1" = "$specified_pkg" ]] && return 0
  done
  return 1
}

pkg_installed() {
  for installed_pkg in $(pacman -Qeq); do
    [[ "$1" = "$installed_pkg" ]] && return 0
  done
  return 1
}

pkgs_to_remove() {
  for installed_pkg in $(pacman -Qeq); do
    pkg_specified "$installed_pkg" || echo "$installed_pkg"
  done
  pacman -Qdtq
}

pkgs_to_install() {
  for specified_pkg in $SPECIFIED_PKGS; do
    pkg_installed "$specified_pkg" || echo "$specified_pkg"
  done
}

install_pkgs_txt=$(pkgs_to_install)
if [ -n "$install_pkgs_txt" ]; then
  printf "Packages to install:\n%s\n" "$install_pkgs_txt"
  read -rp "Install them? [Y/n] " answer
  if [ "$answer" != "n" ]; then
    readarray -t install_pkgs < <(pkgs_to_install)
    pikaur -S "${install_pkgs[@]}"
  fi
fi

remove_pkgs_txt=$(pkgs_to_remove)
if [ -n "$remove_pkgs_txt" ]; then
  printf "Packages to remove:\n%s\n" "$remove_pkgs_txt"
  read -rp "Remove them? [Y/n] " answer
  if [ "$answer" != "n" ]; then
    readarray -t remove_pkgs < <(pkgs_to_remove)
    sudo pacman -Rsn "${remove_pkgs[@]}"
  fi
fi

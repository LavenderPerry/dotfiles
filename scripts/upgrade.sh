#!/bin/sh

# Outputs progress message similar to style of pacman/pikaur
starting_upgrade_message() {
  printf "\n\e[34;1m::\e[37m Starting %s upgrade...\e[0m\n" "$@"
}

pikaur -Syu

# Vencord needs to be reinstalled on any Discord update
[ -f /usr/lib/discord/app.asar ] && install_vencord

starting_upgrade_message "Ruby gem"
gem update

starting_upgrade_message "Neovim plugin"
nvim --headless "+Lazy! sync" +qa

# Save upgrade time for Polybar upgrade reminder
date +%s > ~/.cache/last_upgrade_time

printf "\n\nAll upgrades are done!"

#!/usr/bin/env sh

# Outputs progress message similar to style of pacman/pikaur
starting_upgrade_message() {
  printf "\n\e[34;1m::\e[37m Starting %s upgrade...\e[0m\n" "$@"
}

# Arch package updates
pikaur -Syu

# Ruby gem updates
starting_upgrade_message "Ruby gem"
gem update

# Neovim plugin updates
starting_upgrade_message "Neovim plugin"
nvim_output=$(nvim --headless "+Lazy! sync" +qa)
[ "$nvim_output" ] && echo "$nvim_output" || echo " upgrade gave no output"

# save upgrade time (for Polybar upgrade reminder)
date +%s > ~/.cache/last_upgrade_time

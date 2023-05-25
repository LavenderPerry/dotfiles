#!/bin/sh

pikaur -Syu
[ -f /usr/lib/discord/app.asar ] && install-vencord # Reinstalls Vencord if needed
rustup update
nvim --headless "+Lazy! sync" +qa
date +%s > ~/.cache/last_upgrade_time # Saves upgrade time for Polybar upgrade reminder
printf "\n\nAll upgrades are done!"

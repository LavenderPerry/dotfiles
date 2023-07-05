#!/usr/bin/bash

sudo mv /usr/lib/discord/app.asar /usr/lib/discord/app.asar_PRE
pikaur -Syu
if [ -f /usr/lib/discord/app.asar ]; then
  sudo rm -r /usr/lib/discord/app.asar_PRE
  install-vencord
else
  sudo mv /usr/lib/discord/app.asar_PRE /usr/lib/discord/app.asar
fi

gem update

nvim --headless "+Lazy! sync" +qa

date +%s > ~/.cache/last_upgrade_time # Saves upgrade time for Polybar upgrade reminder
printf "\n\nAll upgrades are done!\nPlease restart the system.\n"

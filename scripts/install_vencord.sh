#!/bin/sh

DISCORD_DIR=/usr/lib/discord
ASAR="$DISCORD_DIR/app.asar"
VENCORD_DIR=~/.config/Vencord/dist

echo "Installing/Reinstalling Vencord..."

pikaur -Qq discord-electron-openasar || pikaur -S discord-electron-openasar

sudo mv "$ASAR" "$DISCORD_DIR/_app.asar"
sudo mkdir -p "$ASAR"
mkdir -p "$VENCORD_DIR"

# Prevent node.js fuckery,
# see https://github.com/Vencord/Installer/blob/89c834585dbf07f3165588218175f857b022d207/github_downloader.go#LL139-L142
touch "$VENCORD_DIR/package.json"

for file in \
  patcher.js patcher.js.map \
  preload.js preload.js.map \
  renderer.js renderer.js.map renderer.css
do
  curl -L "https://github.com/Vendicated/Vencord/releases/download/devbuild/$file" \
    -o "$VENCORD_DIR/$file"
done

echo "require(\"$VENCORD_DIR/patcher.js\");" | sudo tee "$ASAR/index.js"
echo '{ "name": "discord", "main": "index.js" }' | sudo tee "$ASAR/package.json"

echo "Finished installing Vencord!! Restart Discord if it is running"

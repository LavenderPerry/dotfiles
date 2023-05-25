# dotfiles

My dotfiles for Arch Linux, managed using [YADM](https://yadm.io)\
*Screenshot will be here soon™*

> **Warning**:
> I am not responsible to any issues that arise from using these.
> However, if you do encounter any, please create an issue on this repository.
> These are (and likely will always be) subject to change, as most dotfiles are.

## Install
```sh
sudo pacman -S yadm
yadm clone https://github.com/LavenderPerry/dotfiles
# look at / edit dotfiles before running this
yadm bootstrap
```

## Scripts
### install-vencord
Manually Installs Vencord to work with the discord-electron-openasar package.\
It will do nothing if discord-electron-openasar is not installed.\
Other scripts will call this when needed, so only run it if you want to reinstall.

> **Important**:
> The installation method used by this script is NOT SUPPORTED by Vencord.
> If you run into an issue with Vencord, reproduce it with a normal Discord/Vencord
> before seeking support from Vencord developers/community.
> If you can not reproduce it, open an issue on this repository.

### sync-spec
Removes any installed packages not specified within the files in ~/.config/packages/ \
Running this is not recommended until you customize these files

### upgrade
Run this instead of pacman/pikaur -Syu to update your system.\
It updates Arch Linux packages, Neovim plugins, and developer tools.\
Also, it runs `install-vencord` when needed to prevent updates from overwriting Vencord. \
Additionally, it saves the time of the upgrade for the Polybar upgrade reminder to work.

## Files you may want to edit
* **.gitconfig** -- change to use your own name/email
* **.config/packages/essential** -- remove what you don't want installed
* **.config/yadm/bootstrap** -- make changes depending on what packages you removed
* **readme.md**, **LICENSE** -- delete after install

You may want to delete any configs of packages you removed from the essential packages\
Additionally, it is recommended to look through and customize ALL files in this repository

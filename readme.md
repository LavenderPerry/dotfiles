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

## Updating
When updating your system, run `upgrade` instead of pacman/pikaur -Syu.\
This is actually `scripts/upgrade.sh`, but gets symlinked to `bin/upgrade` on bootstrap.\
`upgrade` updates Arch Linux packages, Ruby gems, and Neovim plugins.\
It reinstalls Vencord after a Discord update (if discord-electron-openasar is installed). \
Also, it saves the time of the upgrade for the Polybar upgrade reminder to work.

To upgrade the dotfiles, run `yadm pull`. You may also need to run `yadm bootstrap` again.

## Files you may want to edit
* **.gitconfig**, **.stack/config.yaml** -- change to use your own name/email
* **.config/yadm/packages_essential.txt** -- remove what you don't want installed
* **.config/yadm/bootstrap** -- make changes depending on what packages you removed
* **readme.md**, **LICENSE** -- delete after install

You may want to delete any configs of packages you removed from packages_essential.txt\
Additionally, it is recommended to look through ALL files in this repository

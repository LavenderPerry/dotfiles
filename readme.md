# dotfiles

My dotfiles for Arch Linux, managed using [YADM](https://yadm.io)

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
When updating your system, run `bin/upgrade` instead of pacman/pikaur -Syu.\
This script takes care of both Arch Linux packages and Neovim plugins.\
It also saves the time of the upgrade for the Polybar upgrade reminder to work.

To upgrade the dotfiles, run `yadm pull`. You may also need to run `yadm bootstrap` again.

## Using with my startpage (only works on Firefox/Librewolf/etc)
1. Go to <about:preferences#home>
2. Set "Homepage and new windows" to "Custom URLs"
3. In the text box that appears, enter <https://lavenderperry.github.io/startpage>
4. Install [New Tab Override](https://addons.mozilla.org/en-US/firefox/addon/new-tab-override)
5. Set the option to "current home page"

## Files you may want to edit
* **.gitconfig**, **.stack/config.yaml** -- change to use your own name/email
* **.config/yadm/packages_essential.txt** -- remove what you don't want installed
* **.config/yadm/bootstrap** -- make changes depending on what packages you removed
* **readme.md**, **LICENSE** -- delete after install

You may want to delete any configs of packages you removed from packages_essential.txt\
Additionally, it is recommended to look through ALL files in this repository

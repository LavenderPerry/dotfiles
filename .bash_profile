# Set environment variables
PATH=~/bin:$PATH
export EDITOR="nvim"
export HISTCONTROL="erasedups"

# Start desktop at login
# https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec startx

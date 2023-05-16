# Set environment variables
source "$HOME/.bash_env"

# Start desktop at login
# https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec startx

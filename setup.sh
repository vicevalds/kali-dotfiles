#!/usr/bin/env sh

###
# USAGE: sh setup.sh
###

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

sudo apt install -y rofi brightnessctl flameshot kitty xclip
sudo cp onedark.rasi /usr/share/rofi/themes
cp -r .config/kitty .config/rofi .config/user.png ~/.config
cp .zshrc ~/.

sudo cp -r img/ /usr/share/backgrounds/
xfconf-query -c xfce4-desktop -p $(xfconf-query -c xfce4-desktop -l | grep "workspace0/last-image") -s /usr/share/backgrounds/img/forest.png

xfce4-panel-profiles load xfce4-custom.tar.bz2

# xfconf-query -c xfce4-keyboard-shortcuts -l
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>e' -s "thunar"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>m' -s "rofi -show drun"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super><Shift>m' -s "rofi -show"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>Return' -s "kitty"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/Print' -s "flameshot gui"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>b' -s "firefox"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Shift>F3' -s "brightnessctl set +5%"
xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Shift>F2' -s "brightnessctl set 5%-"

firefox https://discord.com/api/download?platform=linux&format=deb
echo "sudo dpkg -i ~/Downloads/discord*"|xclip -sel clip
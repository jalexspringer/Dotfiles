#!/bin/bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#
# -----------------------------------------------------
# Quit all running waybar instances
# -----------------------------------------------------
killall waybar
pkill waybar
sleep 0.5


if [[ $USER = "alexs" ]]
then
  waybar -c ~/dotfiles/waybar/myconfig & -s ~/dotfiles/waybar/style.css
else
  waybar &
fi

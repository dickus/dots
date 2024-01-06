#!/bin/sh

arg=$1
f="screen_$(date +%F_%H%M%S)".png

case "$arg" in
    screen) import -window root $HOME/Pictures/"$f" && xclip -sel clip -t image/png -i $HOME/Pictures/"$f";;
    window) import -window "$(xdotool getwindowfocus)" $HOME/Pictures/"$f" && xclip -sel clip -t image/png -i $HOME/Pictures/"$f";;
    region) import $HOME/Pictures/"$f" && xclip -sel clip -t image/png -i $HOME/Pictures/"$f";;
esac


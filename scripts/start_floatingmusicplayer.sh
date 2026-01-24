#!/usr/bin/env bash 

# Explicitly start my music player software with the title 'floatingmusicplayer' to consistently manage it in i3 and only open once.
xdotool search 'floatingmusicplayer' windowactivate

if [ "$?" -ne "0" ]
then
    # Use kitty for best image support from rmpc
    kitty --title floatingmusicplayer rmpc
fi

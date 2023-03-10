#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="mybright"

# Change the volume using alsa(might differ if you use pulseaudio)

# Query amixer for the current volume and whether or not the speaker is muted
bright="$(light -G | awk -F'.' '{print $1}')"
    # Show the volume notification
notify-send -a "changeBright" -u low -i display-brightness-symbolic -h string:x-dunst-stack-tag:$msgTag \
-h int:value:"$bright" "Brightness: ${bright}%"
# Play the volume changed sound
#canberra-gtk-play -i audio-volume-change -d "changeVolume"

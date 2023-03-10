#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using alsa(might differ if you use pulseaudio)

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(pactl get-sink-volume 0 | awk -F'/' '{print $2}' | tr -d " " | tr -d "\n")"
mute="$(amixer -D pipewire get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ $volume == 0 || "$mute" == "off" ]]; then
    # Show the sound muted notification
    notify-send -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"0" "Volume muted"
else
    # Show the volume notification
    notify-send -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}"
fi
# Play the volume changed sound
#canberra-gtk-play -i audio-volume-change -d "changeVolume"

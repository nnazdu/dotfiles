#!/bin/bash
CURR_SSID=$(iwgetid | grep ESSID | cut -d\" -f2)
HOME_SSID="FRITZante 5GHz"
DNS="192.168.178.1"
if [ "$CURR_SSID" == "$HOME_SSID" ]; then
    mullvad dns set custom $DNS
    #notify-send "DNS set to local"
else
    mullvad dns set default
    #notify-send "DNS set to Mullvad's"
fi
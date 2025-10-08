#!/bin/bash

INTERFACE="$1"    # Network interface (e.g., wlan0, eth0)
STATUS="$2"       # Connection status (e.g., up, down)

# Get current SSID (for WiFi)
SSID=$(iwgetid -r 2>/dev/null)

# Log network changes
echo "$(date) - Interface: $INTERFACE, Status: $STATUS, SSID: ${SSID:-N/A}" >> /var/log/network-change.log

# Example Actions
if [ "$STATUS" = "up" ]; then
    echo "Connected to $SSID on $INTERFACE"
    
    USER="nazdu"
    USER_ID=$(id -u "$USER")

    # Get the correct D-Bus session address dynamically
    export DISPLAY=:0
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$USER_ID/bus"

    # Debug: Check if environment variables are set correctly
    # echo "User: $USER, UID: $USER_ID" >> /tmp/mullvad_dns.log
    # echo "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" >> /tmp/mullvad_dns.log
    # echo "DISPLAY=$DISPLAY" >> /tmp/mullvad_dns.log

    # Get current SSID
    CURR_SSID=$SSID
    HOME_SSID="FRITZante 5GHz"
    DNS="192.168.178.5"

    if [ "$CURR_SSID" == "$HOME_SSID" ]; then
        mullvad dns set custom $DNS
        notify-send "DNS set to local"
    else
        mullvad dns set default
        notify-send "DNS set to Mullvad's"
    fi
fi
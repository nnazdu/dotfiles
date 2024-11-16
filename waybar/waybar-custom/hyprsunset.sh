#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null
    then
        printf '"class": "default"'
        killall hyprsunset
    else
        printf '"class": "activated"'
        hyprsunset -t 5500
fi
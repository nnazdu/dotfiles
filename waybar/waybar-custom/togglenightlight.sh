#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null
    then
        killall hyprsunset
    else
        hyprsunset -t 5500
fi
#!/bin/bash
if pgrep -x "hyprsunset" > /dev/null
    then
        printf '{"class": "default"}';
    else
        printf '{"class": "activated"}';
fi
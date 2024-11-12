#!/bin/bash
MODE=`sudo bash -c "cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode"`

if ((MODE == 1)) ; then 
    echo 'battery conservation mode is enabled: disable? y/n'
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        sudo bash -c "echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode"
        echo 'conservation mode is now disabled'
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        echo 'okay, aborting...'
    fi
else
    echo 'battery conservation mode is disabled: enable it? y/n'
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        sudo bash -c "echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode"
        echo 'conservation mode is now enabled'
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        echo 'okay, aborting...'
    fi
fi
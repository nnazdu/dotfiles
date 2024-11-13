#!/bin/bash

#This is a script for enabling battery conservation mode for lenovo laptops with acpi_call through the ideapad-laptop module 


MODE=`sudo bash -c "cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode"`

if ((MODE == 1)) ; then 
    echo 'battery conservation mode is enabled: disable? y'
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        sudo bash -c "echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode"
        echo 'conservation mode is now disabled'
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        echo 'okay, aborting...'
    fi
else
    echo 'battery conservation mode is disabled: enable it? y'
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        sudo bash -c "echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode"
        echo 'conservation mode is now enabled'
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        echo 'okay, aborting...'
    fi
fi
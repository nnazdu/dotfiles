#!/bin/bash

echo "nnazdu/dotfiles installation script"
echo "checking distribution..."

distroisarch=$(cat /etc/*-release | grep -q 'Arch')

if $distroisarch ; then 
    echo suka
else
    exit
fi


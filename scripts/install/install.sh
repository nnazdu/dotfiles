#!/bin/bash
package_install () {
    printf "Installing base dotfiles dependencies... \n(the script installs through pacman the packages listed in /scripts/install/packages and /scripts/install/laptop-packages) \n"
    printf "Continue? y/n \n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "Calling pacman... \n\n"
        pacman -S - < install/packages
        printf "Are you running on a laptop? y/n\n"
        read ask
        if [[ $ask =~ ^[Yy]$ ]] ; then
            printf "Installing laptop-specific packages...\n\n"
            pacman -S - < install/laptop-packages
        elif [[ $ask =~ ^[Nn]$ ]] ; then
            printf "Okay, aborting... \n\n"
        fi
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "Okay, aborting... \n\n"
    fi
}

symlinks () {
    printf "Creating symbolic links. This will delete any previous configuration. \nContinue? y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "deleting old configs...\n"
        rm -r /home/$USER/.config/hypr/
        rm -r /home/$USER/.config/dunst/
        rm -r /home/$USER/.config/gtk-3.0/
        rm -r /home/$USER/.config/gtk-4.0/
        rm -r /home/$USER/.config/kitty/
        rm -r /home/$USER/.config/ohmyposh/
        rm -r /home/$USER/.config/rofi/
        rm -r /home/$USER/.config/scripts/
        rm -r /home/$USER/.config/waybar/
        rm -r /home/$USER/.config/waypaper/ 
        rm /home/$USER/.bashrc
        printf "Creating symlinks...\n\n"
        ln -s /home/$USER/dotfiles/hypr /home/$USER/.config/hypr
        ln -s /home/$USER/dotfiles/dunst /home/$USER/.config/dunst
        ln -s /home/$USER/dotfiles/gtk-3.0 /home/$USER/.config/gtk-3.0
        ln -s /home/$USER/dotfiles/gtk-4.0 /home/$USER/.config/gtk-4.0 
        ln -s /home/$USER/dotfiles/kitty /home/$USER/.config/kitty 
        ln -s /home/$USER/dotfiles/ohmyposh /home/$USER/.config/ohmyposh
        ln -s /home/$USER/dotfiles/rofi /home/$USER/.config/rofi
        ln -s /home/$USER/dotfiles/scripts /home/$USER/.config/scripts
        ln -s /home/$USER/dotfiles/waybar /home/$USER/.config/waybar
        ln -s /home/$USER/dotfiles/waypaper /home/$USER/.config/waypaper
        ln -s /home/$USER/dotfiles/.bashrc /home/$USER/.bashrc
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "Okay, aborting... \n\n"
    fi
}

printf "nnazdu/dotfiles installation script\n\n"
printf "Checking distribution... \n"

distroisarch=$(cat /etc/*-release | grep -q 'Arch')

if $distroisarch ; then 
    printf "You are running on Arch! Would you like to install dependencies? y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        package_install
        symlinks
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        symlinks
    fi
else
    printf "You are not running on Arch! config will be copied but packages will NOT be installed.\n"
    printf "Continue? y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        symlinks
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "okay, aborting... \n"
    fi
fi

printf "All done!\n"

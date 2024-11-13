#!/bin/bash
package_install () {
    printf "Installing base dotfiles dependencies... \n(the script installs through pacman the packages listed in /scripts/install/packages and /scripts/install/laptop-packages) \n"
    printf "Continue? y/n \n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "Calling pacman... \n\n"
        yay -S --noconfirm - < /home/$USER/dotfiles/scripts/install/packages
        printf "Are you running on a laptop? y/n\n"
        read ask
        if [[ $ask =~ ^[Yy]$ ]] ; then
            printf "Installing laptop-specific packages...\n\n"
            yay -S --noconfirm - < /home/$USER/dotfiles/scripts/install/laptop-packages
        elif [[ $ask =~ ^[Nn]$ ]] ; then
            printf "Okay, aborting... \n\n"
        fi
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "Okay, aborting... \n\n"
    fi
}

symlinks () {
    printf "Would you like to backup your existing config? y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "Backing up in /dotfiles/backup/...\nMM\n"
        mkdir /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/hypr/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/dunst/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/gtk-3.0/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/gtk-4.0/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/kitty/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/ohmyposh/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/rofi/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/scripts/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/waybar/ /home/$USER/dotfiles/backup/
        cp -r /home/$USER/.config/waypaper/ /home/$USER/dotfiles/backup/
        cp /home/$USER/.bashrc /home/$USER/dotfiles/backup/
        printf "Done!\n"
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "Okay, proceed at your risk! \n\n"
    fi
    printf "Creating symbolic links. This will delete any previous configuration. \nContinue? y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "Creating symlinks...\n\n"
        ln -sf /home/$USER/dotfiles/hypr/* /home/$USER/.config/hypr/
        ln -sf /home/$USER/dotfiles/dunst/* /home/$USER/.config/dunst/
        ln -sf /home/$USER/dotfiles/gtk-3.0/* /home/$USER/.config/gtk-3.0/
        ln -sf /home/$USER/dotfiles/gtk-4.0/* /home/$USER/.config/gtk-4.0/
        ln -sf /home/$USER/dotfiles/kitty/* /home/$USER/.config/kitty/ 
        ln -sf /home/$USER/dotfiles/ohmyposh/* /home/$USER/.config/ohmyposh/
        ln -sf /home/$USER/dotfiles/rofi/* /home/$USER/.config/rofi/
        # ln -s /home/$USER/dotfiles/scripts /home/$USER/.config/scripts
        ln -sf /home/$USER/dotfiles/waybar/* /home/$USER/.config/waybar/
        ln -sf /home/$USER/dotfiles/waypaper/* /home/$USER/.config/waypaper/
        ln -sf /home/$USER/dotfiles/.bashrc /home/$USER/.bashrc
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

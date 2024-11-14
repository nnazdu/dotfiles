#!/bin/bash
declare -a configs=("hypr" "dunst" "gtk-3.0" "gtk-4.0" "kitty" "ohmyposh" "rofi" "scripts" "waybar" "wallpaper" "waypaper")

package_install () {
    printf "yay is required in order to install AUR packages\n"
    printf "Installing base dotfiles dependencies... \n(the script installs through yay the packages listed in /scripts/install/packages and /scripts/install/laptop-packages) \n"
    printf "Continue? y/n \n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "Invoking pacman... \n\n"
        sudo pacman -S --noconfirm - < /home/$USER/dotfiles/scripts/install/stable-packages
        printf "Invoking yay... \n\n"
        yay S --noconfirm - < /home/$USER/dotfiles/scripts/install/AUR-packages
        printf "Are you running on a laptop? y/n\n"
        read ask
        if [[ $ask =~ ^[Yy]$ ]] ; then
            printf "Installing laptop-specific packages...\n\n"
            sudo pacman -S --noconfirm - < /home/$USER/dotfiles/scripts/install/laptop-packages
        elif [[ $ask =~ ^[Nn]$ ]] ; then
            printf "Okay, aborting... \n\n"
        fi
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "Okay, aborting... \n\n"
    fi
}

symlinks () {
    printf "Would you like to backup your existing config? Previous backups will be deleted y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        if test -d /home/$USER/dotfiles/backup/; then
            printf "Removing previous backups...\n"
            rm -r /home/$USER/dotfiles/backup/
        else
            mkdir /home/$USER/dotfiles/backup/
        fi

        printf "Backing up in /dotfiles/backup/...\nMM\n"
        for i in "${configs[@]}"
            do
                cp -r /home/$USER/.config/$i/ /home/$USER/dotfiles/backup/
            done
        cp /home/$USER/.bashrc /home/$USER/dotfiles/backup/
        printf "Done!\n"
    elif [[ $ask =~ ^[Nn]$ ]] ; then
        printf "Okay, proceed at your risk! \n\n"
    fi
    printf "Creating symbolic links. This will delete any previous configuration. \nContinue? y/n\n"
    read ask
    if [[ $ask =~ ^[Yy]$ ]] ; then
        printf "Checking for directories... \n"
        for i in "${configs[@]}"
            do
                if test -d /home/$USER/.config/$i; then
                    printf "$i folder exists.\n"
                else
                    printf "$i folder does not exist, creating dir...\n"
                fi
            done
    printf "Creating symlinks...\n\n"
    for i in "${configs[@]}"
        do
            ln -sf /home/$USER/dotfiles/$i/* /home/$USER/.config/$i/
        done
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

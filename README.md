# Dotfiles - With Hyprland and Hyprpanel!
## DISCLAIMER
I cannot guarantee the install script uses the best practices for package management and symbolic linking.  
This is what works for me, use at your own risk!  
For desktop users: hyprpanel's layout is currently designed around laptop usage, more configuration is needed
## Screenshots
![image](https://github.com/user-attachments/assets/3742ef6b-cec7-430d-bc19-924fc4e8aaed)
![image](https://github.com/user-attachments/assets/cfe52a39-3f11-4cd2-8ed8-0cbfb0541025)
![image](https://github.com/user-attachments/assets/a05a973a-2dac-49f4-a766-b1336aebfbaa)


## Installation script
This repo contains a barebones installation script that installs required packages from stable repositories and AUR and then symlinks configuration files  
  
The script is located in scripts/install/install.sh  

It will prompt you to backup the existing configuration files in /dotfiles/backup/ and then install required packages through pacman and yay.  

## Packages
### Stable repositories
- ttf-jetbrains-mono-nerd
- ttf-hack-nerd
- rofi-wayland
- kitty
- htop
- grim
- slurp
- fastfetch
- wl-clipboard
- hyprland
- hyprpaper
- hyprlock
- blueman
- pavucontrol
- nautilus
- gnome-calendar
- hypridle
- power-profiles-daemon
- brightnessctl

### AUR
- oh-my-posh
- waypaper
- hyprpolkitagent-git
- hyprsunset
- ags-hyprpanel-git
- brave-bin
- mullvad-vpn-bin

## ToDos
- waybar configuration for desktop
- permission configuration for scripts

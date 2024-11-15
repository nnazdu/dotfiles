# Dotfiles - With Hyprland and Waybar!
## DISCLAIMER
I cannot guarantee the install script uses the best practices for package management and symbolic linking.  
This is what works for me, use at your own risk!  
For desktop users: right now the waybar layout is designed around laptop usage, manual configuration is required.
## Screenshots
![image](https://github.com/user-attachments/assets/3742ef6b-cec7-430d-bc19-924fc4e8aaed)
![image](https://github.com/user-attachments/assets/cfe52a39-3f11-4cd2-8ed8-0cbfb0541025)
![image](https://github.com/user-attachments/assets/a05a973a-2dac-49f4-a766-b1336aebfbaa)


## Installation script
This repo contains a barebones installation script that installs required packages from stable repositories and AUR and then symlinks configuration files  
  
The script is located in scripts/install/install.sh  

It will prompt you to backup the existing configuration files in /dotfiles/backup/ and then install required packages through yay.  

## Packages
### Stable repositories
- hyprland
- hyprpaper
- hyprlock
- fastfetch
- wl-clipboard
- rofi-wayland
- waybar
- dunst
- kitty
- htop
- grim
- slurp
- blueman
- pavucontrol
- nautilus
- gnome-calendar
- ttf-hack-nerd
- ttf-jetbrains-mono-nerd
### AUR
- oh-my-posh
- waypaper

## ToDos
- waybar configuration for desktop

#!/bin/bash
current_dir=$(pwd)

read -n1 -rep 'Would you like to install the packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    paru -S --noconfirm hyprland waybar \
    swaybg swaylock-effects wofi wlogout mako thunar \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    polkit-dumb-agent-git python-requests \
    swappy grim slurp pamixer brightnessctl gvfs \
    bluez bluez-utils lxappearance xfce4-settings \
    dracula-gtk-theme dracula-icons-git xdg-desktop-portal-hyprland

    # Start the bluetooth service
    echo -e "Starting the Bluetooth Service...\n"
    sudo systemctl enable --now bluetooth.service
    sleep 2
    
    # Clean out other portals
    echo -e "Cleaning out conflicting xdg portals...\n"
    paru -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk
fi

read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
    cp -R i3 ~/.config/
    cp -R picom ~/.config/
    cp -R st ~/.config/
    cp -R hypr ~/.config/
    cp -R mako ~/.config/
    cp -R waybar ~/.config/
    cp -R wofi ~/.config/
    cp -R .zshrc ~/.zshrc
    cp -R .aliases ~/.aliases

    
    # Set some files as exacutable 
    chmod +x ~/.config/hypr/xdg-portal-hyprland
    chmod +x ~/.config/waybar/scripts/waybar-wttr.py
fi

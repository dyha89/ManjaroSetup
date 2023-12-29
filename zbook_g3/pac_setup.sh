#!/bin/bash

APPS="vim wine wine-mono code manjaro-pipewire pipewire-jack lib32-pipewire-jack lutris wireshark-qt retroarch vlc fdupes qbittorrent uget signal-desktop"
AUR_APPS="google-chrome wineasio gdown emulationstation-de"

# Upgrade everything
echo '          !!UPGRADE!!'
sudo pamac upgrade --no-confirm

# Install packages
echo '          !!APPS!!'
sudo pamac install $APPS --no-confirm

# Install AUR packages
echo '          !!AUR!!'
sudo pamac build $AUR_APPS --no-confirm

# Flatpak packages
# flatpak install flathub com.github.powertab.powertabeditor




# MISC

# setup black background
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'


# podłączyć magdy google photos
# backup google drive'a
# auto backup gphotos-sync
# kopia zapasowa dysku całego

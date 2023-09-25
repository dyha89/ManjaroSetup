#!/bin/bash

APPS="vim wine wine-mono code manjaro-pipewire pipewire-jack lib32-pipewire-jack lutris"
AUR_APPS="google-chrome wineasio gdown"

# Upgrade everything
echo '          !!UPGRADE!!'
sudo pamac upgrade

# Install packages
echo '          !!APPS!!'
sudo pamac install $APPS --no-confirm

# Install AUR packages
echo '          !!AUR!!'
sudo pamac build $AUR_APPS --no-confirm




# MISC

# setup black background
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'


# Removed because of this error:
# Error opening directory “dist/schemas/”: No such file or directory
# gnome-shell-extension-material-shell
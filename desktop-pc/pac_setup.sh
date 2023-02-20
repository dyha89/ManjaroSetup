#!/bin/bash

APPS="vim lutris w3m wine openssh yay tmux base-devel evtest lshw moc gnome-disk-utility ffmpeg ranger gerbera syncthing"

sudo pacman -Syu --noconfirm

sudo pacman -S $APPS --noconfirm

sudo systemctl enable sshd.service
sudo systemctl start sshd.service

sudo useradd --system gerbera
sudo mkdir /etc/gerbera
sudo chown -Rv gerbera:gerbera /etc/gerbera
sudo systemctl daemon-reload
sudo systemctl start gerbera

#https://github.com/syncthing/syncthing/blob/main/etc/linux-desktop/syncthing-start.desktop
#Copy syncthing-start.desktop to ~/.config/autostart/.
#sudo useradd --system syncthingusr
#sudo systemctl enable syncthing@syncthingusr.service
#sudo systemctl start syncthing@syncthingusr.service

wget https://raw.githubusercontent.com/syncthing/syncthing/main/etc/linux-desktop/syncthing-start.desktop
mv ./syncthing-start.desktop ~/.config/autostart/

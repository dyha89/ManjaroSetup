#!/bin/bash

APPS="vim lutris w3m wine openssh yay tmux base-devel evtest lshw"

sudo pacman -Syu --noconfirm

sudo pacman -S $APPS --noconfirm

sudo systemctl enable sshd.service
sudo systemctl start sshd.service

YAYAPPS="xboxdrv"
#dotnet-sdk-bin
#xrdp

yay -S $YAYAPPS --noconfirm

#!/bin/bash

APPS="vim lutris w3m wine openssh yay tmux base-devel"

sudo pacman -Syu --noconfirm

sudo pacman -S $APPS --noconfirm

sudo systemctl enable sshd.service
sudo systemctl start sshd.service

YAYAPPS="xboxdrv"

yay -S $YAYAPPS --noconfirm

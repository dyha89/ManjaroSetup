#!/bin/bash

APPS="vim lutris w3m wine openssh yay tmux"

pacman -Syu

pacman -S $APPS --noconfirm

systemctl enable sshd.service
systemctl start sshd.service

YAYAPPS="xboxdrv"

yay -S $YAYAPPS --noconfirm

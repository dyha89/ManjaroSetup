#!/bin/bash

APPS="vim lutris w3m wine openssh yay tmux base-devel evtest lshw moc gnome-disk-utility ffmpeg"

sudo pacman -Syu --noconfirm

sudo pacman -S $APPS --noconfirm

sudo systemctl enable sshd.service
sudo systemctl start sshd.service

YAYAPPS="xboxdrv foobar2000 enca"
#dotnet-sdk-bin

yay -S $YAYAPPS --noconfirm

sudo cp vconsole.conf /etc/vconsole.conf


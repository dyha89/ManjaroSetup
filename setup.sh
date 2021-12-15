#!/bin/bash

APPS="vim lutris w3m wine openssh"

pacman -Syu

pacman -S $APPS --noconfirm

systemctl enable sshd.service
systemctl start sshd.service

# https://tuxfixer.com/configure-ssh-service-in-manjaro-linux/

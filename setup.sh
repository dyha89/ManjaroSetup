#!/bin/bash

APPS="vim lutris w3m wine"

pacman -Syu

pacman -S $APPS --noconfirm

# https://tuxfixer.com/configure-ssh-service-in-manjaro-linux/

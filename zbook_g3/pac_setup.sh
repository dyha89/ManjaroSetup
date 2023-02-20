#!/bin/bash

APPS="vim wine wine-mono kio-gdrive"

sudo pacman -Syu --noconfirm

sudo pacman -S $APPS --noconfirm

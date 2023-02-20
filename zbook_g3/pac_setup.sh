#!/bin/bash

APPS="vim wine wine-mono"

sudo pacman -Syu --noconfirm

sudo pacman -S $APPS --noconfirm

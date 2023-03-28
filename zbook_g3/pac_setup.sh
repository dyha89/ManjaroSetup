#!/bin/bash

APPS="vim wine wine-mono code"
AUR_APPS="google-chrome"

# Upgrade everything
sudo pamac upgrade

# Install packages
sudo pamac install $APPS --no-confirm

# Install AUR packages
sudo pamac build $AUR_APPS --no-confirm

# Install PIP packages
python -m ensurepip --upgrade
python -m pip install gdown

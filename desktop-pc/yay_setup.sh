#!/bin/bash

YAYAPPS="xboxdrv foobar2000 enca dotnet-sdk-bin"

yay -S $YAYAPPS --noconfirm

sudo cp vconsole.conf /etc/vconsole.conf


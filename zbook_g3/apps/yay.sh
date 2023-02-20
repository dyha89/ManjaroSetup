 #!/bin/bash

sudo pacman -S git
sudo pacman -S make

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git

sudo chown -R mariusz:mariusz ./yay-git

cd yay-git

makepkg -si

sudo yay -Syu

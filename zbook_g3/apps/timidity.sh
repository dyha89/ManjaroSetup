#!/bin/bash

sudo pacman -S timidity --noconfirm

# download soundfonts
gdown --folder https://drive.google.com/drive/folders/1LqF-LkLCp6I9xrT7v6m20EU7bi0Lrj9h

# copy soundfonts
sudo cp -r ./files/soundfonts /usr/share

# add system service
cat <<EOT | sudo tee /etc/systemd/user/timidity.service
[Unit]
Description=TiMidity++ Daemon
After=sound.target

[Service]
ExecStart=/usr/bin/timidity -iA &

[Install]
WantedBy=default.target
EOT

FONT_PARAM='soundfont "/usr/share/soundfonts/gm dls remastered version 2.1.sf2"'
CONFIG_PATH='/etc/timidity/timidity.cfg'

# set soundfonts in config
if ! grep -q "$FONT_PARAM" "$CONFIG_PATH"; then
    echo $FONT_PARAM | sudo tee -a "$CONFIG_PATH"
fi

systemctl --user daemon-reload
systemctl --user start timidity.service
systemctl --user enable timidity.service


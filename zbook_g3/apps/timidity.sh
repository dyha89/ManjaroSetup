#!/bin/bash

sudo pacman -S timidity --noconfirm

# download soundfonts
gdown --folder https://drive.google.com/drive/folders/1LqF-LkLCp6I9xrT7v6m20EU7bi0Lrj9h

# copy soundfonts
sudo cp -r ./soundfonts /usr/share

# add system service
cat <<EOT | sudo tee /etc/systemd/user/timidity.service
[Unit]
Description=TiMidity++ Daemon
After=sound.target

[Service]
ExecStart=/usr/bin/timidity -iA -B2,8 -Os &

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

exit

# enable midi kernel module
cat <<EOT | sudo tee /etc/modules-load.d/snd-virmidi.conf
snd-virmidi
EOT

sudo pacman -S winetricks
winetricks sound=alsa

# create reg file to activate midi in wine
cat <<EOT | tee ./reg.reg
REGEDIT4

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Multimedia\MIDIMap]
"CurrentInstrument"="#1"
EOT

# apply regedit file
wine start regedit.exe ./reg.reg



#manjaro-pipewire
#pipewire-jack
#wineasio
#libcośtam pipewire jack
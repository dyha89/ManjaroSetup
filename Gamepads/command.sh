#!/bin/bash

# Buttons: A, B, X, Y, RB (frontal upper right), RT (posterior upper right), LB (frontal upper left), LT (posterior upper left), START, BACK
# Directional: DPAD_X (horizontal D-pad), DPAD_Y (vertical D-pad), X1 (left analog horizontal), Y1 (left analog vertical), X2 (right analog horizontal), Y2 (right analog vertical)

#               LT                  RT
#               LB                  RB
#                                           Y
#   X1,Y1,TL        BACK    START       X       B
#                                           A
#       DPAD_Y,DPAD_X           X2,Y2,TR

#sudo pkill -9 xboxdrv

#sudo xboxdrv --evdev=/dev/input/event16 -c 'TGZ Controller.xboxconf' & sudo xboxdrv --evdev=/dev/input/event31 -c 'TGZ Controller.xboxconf' & wait

xboxdrv --verbose --debug --detach-kernel-driver --dbus disabled --daemon --match product=0x181c --config 'TGZ Controller.xboxconf'

# cat /proc/bus/input/devices

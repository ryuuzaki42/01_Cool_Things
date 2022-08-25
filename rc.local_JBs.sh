#!/bin/bash
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local startup commands in here.  Also, if you have
# anything that needs to be run at shutdown time you can
# make an /etc/rc.d/rc.local_shutdown script and put those
# commands in there.
#
# Last update: 25/08/2022
#

if [ -x /etc/rc.d/rc.tlp ]; then
    echo -e "\\n # Starting tlp\\n"
    # https://github.com/linrunner/TLP
    /etc/rc.d/rc.tlp start
fi

echo -e "\\n # Disabling Bluetooth #\\n"
rfkill block bluetooth

if [ -x /etc/rc.d/rc.thinkfan ]; then
    echo -e "\\n # Starting thinkfan #\\n"
    # https://github.com/vmatare/thinkfan
    /etc/rc.d/rc.thinkfan start
fi

# Load the keyboard map. More maps are in /usr/share/kbd/keymaps/
# /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz
echo -e "\\n # Set keyboard layout to BR abnt2 - loadkeys br-abnt2 #\\n"
loadkeys br-abnt2

# Others --------------------------------------------------------------------------

#echo -e "\\n # Starting boot_rcLocal_JBs.sh\\n"
#/usr/bin/boot_rcLocal_JBs.sh

## If your backlight keyboard doesn't work
#echo -e "\\n # Starting UPower\\n"
#qdbus --system org.freedesktop.UPower

## If you have installed NVIDIA video driver with bumblebeed
#if [ -x /etc/rc.d/rc.bumblebeed ]; then
#    echo -e "\\n #Starting bumblebeed #\\n"
#    /etc/rc.d/rc.bumblebeed start
#fi

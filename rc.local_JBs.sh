#!/bin/bash
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local startup commands in here.  Also, if you have
# anything that needs to be run at shutdown time you can
# make an /etc/rc.d/rc.local_shutdown script and put those
# commands in there.
#
# Last update: 12/08/2022
#

if [ -x /etc/rc.d/rc.tlp ]; then
    echo -e "\\nStarting tlp\\n"
    # https://github.com/linrunner/TLP
    /etc/rc.d/rc.tlp start
fi

#echo -e "\\nStarting boot_rcLocal_JBs.sh\\n"
#/usr/bin/boot_rcLocal_JBs.sh

## If your backlight keyboard doesn't work
#echo -e "\\nStarting UPower\\n"
#qdbus --system org.freedesktop.UPower

## If you have installed Nvidia video driver with bumblebeed
#if [ -x /etc/rc.d/rc.bumblebeed ]; then
#    echo -e "\\nStarting bumblebeed\\n"
#    /etc/rc.d/rc.bumblebeed start
#fi

echo -e "\\nDisabling Bluetooth\\n"
rfkill block bluetooth

if [ -x /etc/rc.d/rc.thinkfan ]; then
    echo -e "\\nStarting thinkfan\\n"
    # https://github.com/vmatare/thinkfan
    /etc/rc.d/rc.thinkfan start
fi

#!/bin/bash
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local startup commands in here.  Also, if you have
# anything that needs to be run at shutdown time you can
# make an /etc/rc.d/rc.local_shutdown script and put those
# commands in there.
# - JB cs -
# Last update: 02/06/2023
#
if [ -x /etc/rc.d/rc.tlp ]; then
    echo -e "\\n # Starting tlp #\\n"
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

#echo -e "\\n # Starting Teamviewer #\\n"
#if [ -x /etc/rc.d/rc.teamviewerd ]; then
#    /etc/rc.d/rc.teamviewerd start
#fi

#echo -e "\\n # Update time - Notebook without battery #\\n"
#count=0
#while [ "$count" -lt 10 ]; do
#    result_date_up=$(usual_JBs.sh date-up)
#    if echo "$result_date_up" | grep -q "Time updated"; then
#        count=10
#    else
#        ((count++))
#        echo -n "$count "
#        sleep 1s
#    fi
#done
#echo "$result_date_up"

#echo -e "\\n # Starting boot_rcLocal_JBs.sh #\\n"
#/usr/bin/boot_rcLocal_JBs.sh

## If your backlight keyboard doesn't work
#echo -e "\\n # Starting UPower #\\n"
#qdbus --system org.freedesktop.UPower

## If you have installed NVIDIA video driver with bumblebeed
#if [ -x /etc/rc.d/rc.bumblebeed ]; then
#    echo -e "\\n # Starting bumblebeed #\\n"
#    /etc/rc.d/rc.bumblebeed start
#fi

# - JB ce -

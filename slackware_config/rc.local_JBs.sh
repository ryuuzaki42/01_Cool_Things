#!/bin/bash
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local startup commands in here.  Also, if you have
# anything that needs to be run at shutdown time you can
# make an /etc/rc.d/rc.local_shutdown script and put those
# commands in there.
# - JB cs -
# Last update: 06/06/2024
#
if [ -x /etc/rc.d/rc.tlp ]; then
    echo -e "\n # Starting tlp #\n"
    # https://github.com/linrunner/TLP
    /etc/rc.d/rc.tlp start
fi

echo -e "\n # Disabling Bluetooth #\n"
rfkill block bluetooth

if [ -x /etc/rc.d/rc.thinkfan ]; then
    echo -e "\n # Starting thinkfan #\n"
    # https://github.com/vmatare/thinkfan
    /etc/rc.d/rc.thinkfan start
fi

# Load the keyboard map. More maps are in /usr/share/kbd/keymaps/
# /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz
echo -e "\n # Set keyboard layout to BR abnt2 - loadkeys br-abnt2 #\n"
loadkeys br-abnt2

#echo -e "\n # Starting Teamviewer #\n"
#if [ -x /etc/rc.d/rc.teamviewerd ]; then
#    /etc/rc.d/rc.teamviewerd start
#fi

#echo -e "\n # Update time - Notebook without battery #\n"
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

# Mount a temporary folder to RAM
tmp_RAM_disk="/media/sda2/home/j/Downloads/0_tmp_RAM_disk/"
mkdir "$tmp_RAM_disk" 2> /dev/null

count_RAM_GiB=$(free --giga | grep 'Mem:' | awk '{print $2}')
if [ $count_RAM_GiB -gt 23 ]; then # RAM > 23 GiB
    folder_Max_Size='12g' # Temporary folder of 12 GiB
elif [ $count_RAM_GiB -gt 15 ]; then # RAM > 15 GiB
    folder_Max_Size='6g'
elif [ $count_RAM_GiB -gt 7 ]; then # RAM > 7 GiB
    folder_Max_Size='3g'
else # $count_RAM_GiB < 8
    folder_Max_Size=0
    echo "Less then 8 GiB of RAM - Not mounting folder in RAM"
fi

if [ "$folder_Max_Size" != 0 ]; then
    # Mount temporary folder into RAM
    echo -e "\nMounting temporary folder: \"$tmp_RAM_disk\" with max size of: \"$folder_Max_Size\""
    mount -t tmpfs -o size="$folder_Max_Size" tmpfs "$tmp_RAM_disk"

    # Remove last / to grep result
    tmp_RAM_disk=$(echo "$tmp_RAM_disk" | rev | cut -d '/' -f2- | rev)

    # Print information about the mount
    df -h | grep "$tmp_RAM_disk"
fi
echo

# - JB ce -

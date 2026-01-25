#!/bin/bash
#
# /etc/rc.d/rc.local:  Local system initialization script.
#
# Put any local startup commands in here.  Also, if you have
# anything that needs to be run at shutdown time you can
# make an /etc/rc.d/rc.local_shutdown script and put those
# commands in there.
# - JB cs -
# Last update: 25/01/2026
#
# 1 is true or will run and 0 to false
start_tlp=1 #1
disable_bluetooth=1 #1
start_thinkfan=1 #1

set_keyboard=1 #1 # Load the keyboard map
keyboard_map="br-abnt2" # Change to the desire map. More maps in: /usr/share/kbd/keymaps/

update_date=0 #0 # Need usual_JBs.sh - https://github.com/ryuuzaki42/02_Scripts_Linux/

use_tmp_folder_RAM=1 #1 # Mount a temporary folder to RAM
tmp_folder_RAM="/media/sda2/home/j/Downloads/0_tmp_folder_RAM/" # Change to the desired folder
normal_user="j" # Change to our "normal" user ID/name

disable_touchpad=0 #0

if [ "$start_tlp" == 1 ]; then
    echo -e "\n # Starting tlp #" # https://github.com/linrunner/TLP
    /etc/rc.d/rc.tlp start
fi

if [ "$disable_bluetooth" == 1 ]; then
    echo -e "\n # Disabling Bluetooth #"
    rfkill block bluetooth
fi

if [ "$start_thinkfan" == 1 ]; then
    echo -e "\n # Starting thinkfan #" # https://github.com/vmatare/thinkfan
    /etc/rc.d/rc.thinkfan start
fi

if [ "$set_keyboard" == 1 ]; then
    echo -e "\n # Set keyboard layout to $keyboard_map - loadkeys $keyboard_map #"
    loadkeys "$keyboard_map"
fi

if [ "$update_date" == 1 ]; then
    echo -e "\n # Update time - Notebook without battery #"
    count=0
    while [ "$count" -lt 10 ]; do
        result_date_up=$(usual_JBs.sh noColor notPrintHeader date-up)
        if echo "$result_date_up" | grep -q "Time updated"; then
            count=10
        else
            ((count++))
            echo -n "$count "
            sleep 1s
        fi
    done
    echo "$result_date_up"
fi

if [ "$use_tmp_folder_RAM" == 1 ]; then
    echo -e "\n # Mount a temporary folder to RAM #"
    mkdir "$tmp_folder_RAM" 2> /dev/null

    # Grep count of RAM in MiB - some computers use part of RAM to GPU
    count_RAM_GiB=$(free --mega | grep 'Mem:' | awk '{print $2}')
    if [ "$count_RAM_GiB" -gt 23000 ]; then # RAM > ~ 23 GiB
        folder_RAM_Max_Size='12g' # Temporary folder of 12 GiB
    elif [ "$count_RAM_GiB" -gt 15000 ]; then # RAM > ~ 15 GiB
        folder_RAM_Max_Size='8g'
    elif [ "$count_RAM_GiB" -gt 7000 ]; then # RAM > ~ 7 GiB
        folder_RAM_Max_Size='4g'
    elif [ "$count_RAM_GiB" -gt 5000 ]; then # RAM > ~ 5 GiB
        folder_RAM_Max_Size='3g'
    else # $count_RAM_GiB < ~ 5 GiB
        folder_RAM_Max_Size=0
        echo "Less then 5 GiB of RAM - Not mounting folder in RAM"
    fi

    if [ "$folder_RAM_Max_Size" != 0 ]; then
        # Mount temporary folder into RAM
        echo -e "Mounting temporary folder: \"$tmp_folder_RAM\" with max size of: \"$folder_RAM_Max_Size\""
        mount -t tmpfs -o size="$folder_RAM_Max_Size" tmpfs "$tmp_folder_RAM"

        chmod 777 "$tmp_folder_RAM/" # Change permissions to all user can write
        su - "$normal_user" -c "mkdir $tmp_folder_RAM/0/" # Create a temporary folder "0/"

        # Remove last / to grep result
        tmp_folder_RAM=$(echo "$tmp_folder_RAM" | rev | cut -d '/' -f2- | rev)

        # Print information about the mount
        df -h | grep "$tmp_folder_RAM"
    fi
    echo
fi

if [ "$disable_touchpad" == 1 ]; then
    echo -e "\n # Disabling touchpad (module psmouse) #" # Touchpad with hardware defect
    modprobe -r psmouse
fi

# - JB ce -

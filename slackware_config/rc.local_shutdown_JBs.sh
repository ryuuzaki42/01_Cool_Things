#!/bin/bash
#
# /etc/rc.d/rc.local_shutdown: Local system shutdown script.
#
# Put any commands in here that needs to be run at shutdown time
#
# - JB cs -
# Last update: 12/07/2026
#
# 1 is true or will run and 0 to false
clean_system=1 #1 # Need cleanup_system_JBs.sh - https://github.com/ryuuzaki42/02_Scripts_Linux/ installed in /usr/bin/
user_clean="j"
log_file="/var/log/cleanup_system.log"

if [ "$clean_system" == 1 ]; then
    echo -e "\n # Running cleanup_system_JBs.sh - save log in: $log_file" #"
    date > "$log_file"

    /usr/bin/cleanup_system_JBs.sh "$user_clean" y n >> "$log_file" # As $user_clean - normal clean

    /usr/bin/cleanup_system_JBs.sh root y n >> "$log_file" # As root - normal clean

    #/usr/bin/cleanup_system_JBs.sh root y all y >> "$log_file" # As root - Full clean, Be careful!
fi

# - JB ce -

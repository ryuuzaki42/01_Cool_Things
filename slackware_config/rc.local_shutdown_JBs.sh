#!/bin/bash
#
# /etc/rc.d/rc.local_shutdown: Local system shutdown script.
#
# Put any commands in here that needs to be run at shutdown time
#
# - JB cs -
# Last update: 08/07/2026
#
# 1 is true or will run and 0 to false
clean_system=1 #1 # Need cleanup_system_JBs.sh - https://github.com/ryuuzaki42/02_Scripts_Linux/ installed in /usr/bin/

if [ "$clean_system" == 1 ]; then
    echo -e "\n # Running cleanup_system_JBs.sh all y n #"
    /usr/bin/cleanup_system_JBs.sh all y n
fi

# - JB ce -

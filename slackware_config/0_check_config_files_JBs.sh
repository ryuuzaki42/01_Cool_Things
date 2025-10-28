#!/bin/bash
check_file() {
    command_run="$program $1 $2"
    echo -e "\n # $command_run #"
    eval "$command_run"
}

files_check=("fstrim_JBs.sh" "/etc/cron.weekly/fstrim_JBs.sh"
"greylist_slackpkg_JBc" "/etc/slackpkg/greylist"
"kde_start_JBs.sh" "~/.config/kde_start_JBs.sh"
"lilo.conf_JBc" "/etc/lilo.conf"
"mirrors_slackpkg_15.0_JBc" "/etc/slackpkg/mirrors"
"rc.local_JBs.sh" "/etc/rc.d/rc.local"
"slackpkgplus.conf_15.0_JBc" "/etc/slackpkg/slackpkgplus.conf")

i=0
count_files=${#files_check[*]}
while [ "$i" -lt "$count_files" ]; do
    check_file "${files_check[i]}" "${files_check[$i+1]}"
    i=$((i + 2))
done

#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre: você pode redistribuí-lo e/ou
# modificá-lo sob os termos da Licença Pública Geral GNU (GPL)
# conforme publicada pela Free Software Foundation, tanto a versão 3
# da licença, como (a seu critério) qualquer versão posterior.
#
# Este programa é distribuído na esperança de que seja útil,
# mas SEM NENHUMA GARANTIA; nem mesmo a garantia implícita de
# COMERCIABILIDADE ou ADEQUAÇÃO A UM PROPÓSITO ESPECÍFICO.
# Consulte a Licença Pública Geral do GNU para mais detalhes.
#
# Script: Check Slackware configurations files are equal with the system
#
# Last update: 22/09/2026
#
echo -e "\nUse with program to compare the files?"
echo -n "1 diff, 2 sdiff, 3 kdiff3, 4 smartsynchronize, 5 other (default is 4): "
read -r number_prog

if [ "$number_prog" == 1 ]; then
    program="diff"
elif [ "$number_prog" == 2 ]; then
    program="sdiff"
elif [ "$number_prog" == 3 ]; then
    program="kdiff3"
elif [ "$number_prog" == 4 ] || [ "$number_prog" == '' ]; then
    program="smartsynchronize"
else #"$number_prog" == 5
    echo -n "Use with program: "
    read -r program
fi
echo -e "\nUsing as diff tool: $program\n"

check_file() {
    command_run="$program $1 $2"
    echo -e "\n # $command_run #"
    eval "$command_run"
}

files_check=("fstrim_JBs.sh" "/etc/cron.weekly/fstrim_JBs.sh"
"kill_program_JBs.sh" "/etc/cron.daily/kill_program_JBs.sh"
"greylist_slackpkg_JBc" "/etc/slackpkg/greylist"
"kde_start_JBs.sh" "~/.config/kde_start_JBs.sh"
"lilo.conf_JBc" "/etc/lilo.conf"
"mirrors_slackpkg_15.0_JBc" "/etc/slackpkg/mirrors"
"rc.local_JBs.sh" "/etc/rc.d/rc.local"
"rc.local_shutdown_JBs.sh" "/etc/rc.d/rc.local_shutdown"
"slackpkgplus.conf_15.0_JBc" "/etc/slackpkg/slackpkgplus.conf")

i=0
count_files=${#files_check[*]}
while [ "$i" -lt "$count_files" ]; do
    check_file "${files_check[i]}" "${files_check[$i+1]}"
    i=$((i + 2))
done

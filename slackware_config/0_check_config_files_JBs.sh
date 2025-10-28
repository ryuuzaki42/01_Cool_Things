#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Script: Check Slackware configurations files are equal with the system
#
# Last update: 15/12/2025
#
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

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
# Script: To kill a program - late at night
#
# Last update: 22/09/2026
#
# Tip: Added the script in cron, to auto run, like
#   cp kill_program.sh /etc/cron.daily/ # To run daily
#
# crontab -l as root to see when it run
#    Run daily cron jobs at 4:40 every day:
#    40 4 * * * /usr/bin/run-parts /etc/cron.daily 1> /dev/null
#
# Tip: Added other script to start/restart the program
#   like Anydesk in kde_start_JBs.sh
#

#set -x

program_name="anydesk" # Change to desire program

echo -e "$0 - \"$program_name\" - $(date)"
killall "$program_name"

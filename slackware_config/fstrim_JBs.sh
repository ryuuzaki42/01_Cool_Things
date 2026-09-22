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
# Script: fstrim yours partitions in a SSD
#
# Last update: 22/09/2026
#
# Tip: Added the script in cron, to auto run, like
#    cp fstrim_JBs.sh /etc/cron.weekly/ # To run weekly
#
# crontab -l as root to see when it run
#    # Run weekly cron jobs at 4:30 on the first day of the week:
#    30 4 * * 0 /usr/bin/run-parts /etc/cron.weekly 1> /dev/null
#

#set -x

# Tip: Update the path for the log file ($log_file) if needed
log_file="/var/log/ssd_fstrim.log"

echo -e "\n-----------------------------------" | tee -a "$log_file"
echo "Date: $(date)" | tee -a "$log_file"

# Trim all mounted file systems which support it
fstrim -v --all | tee -a "$log_file"

echo -e "\nlog_file: $log_file\n"

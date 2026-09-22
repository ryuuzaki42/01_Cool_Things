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

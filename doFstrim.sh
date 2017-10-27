#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
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
# Last update: 27/10/2017
#
logFile="/var/log/ssdFtrim.log"

# Chane for your(s) folder(s) where you mount the SSD partition(s)
ssdMountPartitions='/ /media/sda2/'

if [ ! -e "$logFile" ]; then
    touch "$logFile"
fi

echo "------------------------------- " | tee -a "$logFile"
echo "Date: $(date)" | tee -a "$logFile"

for mntPartition in $ssdMountPartitions; do
    echo -e "\nfstrim -v $mntPartition" | tee -a "$logFile"
    fstrim -v "$mntPartition" | tee -a "$logFile"
done

echo "------------------------------- " | tee -a "$logFile"

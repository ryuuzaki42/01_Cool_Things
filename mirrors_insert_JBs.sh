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
# Script: Insert text of mirror in the begin of /etc/slackpkg/mirrors
#
# Last update: 27/10/2017
#
echo -en "\nThis script insert in the begin of /etc/slackpkg/mirrors"
echo -en " the message below about mirrors.\nWant continue? (y)es or (n)o: "
read -r continueOrNot

if [ "$continueOrNot" == 'y' ]; then
    tmpFile="/etc/slackpkg/mirrors.tmp1_$(date +%s)"
    tmpFile2="/etc/slackpkg/mirrors.tmp2_$(date +%s)"

    echo "#
#-----------------------------------------------------------------------------#
# Local CD/DVD drive
#cdrom://media/dvd/
#-----------------------------------------------------------------------------#
# Local Directory
#file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-14.2/
#-----------------------------------------------------------------------------#
# UNITED STATES (US)
ftp://ftp.osuosl.org/.2/slackware/slackware64-14.2/
#-----------------------------------------------------------------------------#
# BRAZIL (BR)
#ftp://ftp.slackware-brasil.com.br/slackware64-14.2/
#-----------------------------------------------------------------------------#
#" > "$tmpFile"

    cat "$tmpFile" /etc/slackpkg/mirrors > "$tmpFile2"

    rm "$tmpFile"

    mv "$tmpFile2" /etc/slackpkg/mirrors
fi
echo -e "\nEnd the script"

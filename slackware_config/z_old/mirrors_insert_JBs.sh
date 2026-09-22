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
# Script: Insert text of mirror in the begin of /etc/slackpkg/mirrors
#
# Last update: 14/11/2017
#
echo -en "\\nThis script insert in the begin of /etc/slackpkg/mirrors"
echo -en " the message below about mirrors.\\nWant continue? (y)es or (n)o: "
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
echo -e "\\nEnd the script\\n"

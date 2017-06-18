#/bin/bash

echo -en "\nThis script insert in the begin of /etc/slackpkg/mirrors"
echo -en " the message below about mirrors.\nWant continue? (y)es or (n)o: "
read continueOrNot

if [ "$continueOrNot" == 'y' ]; then
    tmpFile="/etc/slackpkg/mirrors.tmp1_$(date +%s)"
    tmpFile2="/etc/slackpkg/mirrors.tmp2_$(date +%s)"

    echo "#
#-----------------------------------------------------------------------------#
# Local CD/DVD drive
#cdrom://media/dvd/
#-----------------------------------------------------------------------------#
# Local Directory
file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-14.2/
#-----------------------------------------------------------------------------#
# UNITED STATES (US)
#ftp://ftp.osuosl.org/.2/slackware/slackware64-14.2/
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

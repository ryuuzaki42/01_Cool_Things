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
# Script: Script to do the changes I do every installation
# of the Slackware (with KDE)
#
# Last update: 08/12/2017
#
echo "# Changes in the Slackware - Script #"

userToWork=$1 # User to work with
if [ "$userToWork" == '' ]; then
    echo -e "\\nYou need pass the a user to work with\\nJust exiting\\n"
    exit 1
fi

#--------------------------- A partition to mount ----------------------------------------------
echo "Adding local to mount other partitions"
read -r
partitionToMount="/dev/sda2"
localToMount="/media/sda2"
typeToMount="ext4"

mkdir -p "$localToMount"
echo "Partition $partitionToMount to mount $localToMount"
if ! grep -q "$partitionToMount" /etc/fstab; then
    echo "$partitionToMount        $localToMount      $typeToMount        defaults         1   2" >> /etc/fstab
    echo "Partition to mount set"
else
    echo "Partition mount already set"
fi

#--------------------------- Adding a user ----------------------------------------------
echo "Adding a user passed by parameter"
read -r

tmpFile=$(mktemp)
finger "$userToWork" 2> "$tmpFile"

if grep -q "no such user" "$tmpFile"; then
    /usr/sbin/adduser "$userToWork"
    echo "The user $userToWork created"
else
    echo "The user $userToWork already exist"
fi
rm "$tmpFile"

#--------------------------- Changes in /etc/fstab --------------------------------------
echo "Comment the line with floppy disk"
read -r
sed -i '/floppy/ s/^\/dev/#\/dev/g' /etc/fstab

#--------------------------- Changes in /etc/profile.d/lang.sh --------------------------
echo "Comment the line \"export LANG=en_US\""
read -r
sed -i '/^export LANG=en_US$/ s/export/#export/' /etc/profile.d/lang.sh

echo "Uncomment the line \"#export LANG=en_US.UTF-8\""
read -r
sed -i '/^#export LANG=en_US.UTF-8$/ s/#export/export/' /etc/profile.d/lang.sh

#--------------------------- Changes in /etc/profile.d/lang.csh -------------------------
echo "Comment the line \"setenv LANG en_US\""
read -r
sed -i '/^setenv LANG en_US$/ s/setenv/#setenv/' /etc/profile.d/lang.csh

echo "Uncomment the line \"#setenv LANG en_US.UTF-8\""
read -r
sed -i '/^#setenv LANG en_US.UTF-8$/ s/#setenv/setenv/' /etc/profile.d/lang.csh

#--------------------------- Changes in /etc/acpi/acpi_handler.sh -----------------------
echo "Comment the \"power) /sbin/init 0\" to now halt when the power button is pressed"
read -r
sed -i '/power) \/sbin\/init 0/ s/^#*/#/' /etc/acpi/acpi_handler.sh

#--------------------------- Changes in /etc/inittab ------------------------------------
echo "Disable the standard console (ctrl + alt + f[1-6]) from 6 to 3"
read -r
sed -i '/^c[4-6]:12345/ s/^c/#c/g' /etc/inittab

echo "Duplicate the line with the runlevel \"id:3:initdefault:\" changing \"id:3\" for \"id:4\""
read -r
sed -i '/^id:3:initdefault:/ p; s/^id:3/id:4/' /etc/inittab

echo "Comment the \"id:3\""
read -r
sed -i '/^id:3:initdefault:/ s/^id:3/#id:3/' /etc/inittab

#--------------------------- Create a swap file -----------------------------------------
echo "Grep $userToWork home folder"
read -r
su - "$userToWork" -c 'homeFolder=$(echo ~); echo $homeFolder; export homeFolder'
echo "Home folder of $userToWork: $homeFolder"

#Folder to create the swap file
#localToCreateSwapFile=$homeFolder

# or one that you like
localToCreateSwapFile="/media/sda2/prog"

swapFileName="swapfile.img"

echo "Create swap with 2 GiB: $localToCreateSwapFile/$swapFileName"
read -r
if [ -e "$localToCreateSwapFile" ]; then
    if [ ! -e "$localToCreateSwapFile/$swapFileName" ]; then
        dd if=/dev/zero of="$localToCreateSwapFile/$swapFileName" bs=1M count=2048 # 2 GiB

        echo "Make the file a swap file"
        read -r
        mkswap "$localToCreateSwapFile/$swapFileName"
    else
        echo "Swap file already exist"
    fi
else
    echo "Error: Location to create Swap file do not exist"
fi

echo "Write the configurations in the fstab"
read -r
if ! grep -q "$swapFileName" /etc/fstab; then
    echo "$localToCreateSwapFile/$swapFileName swap swap       defaults         0   0" >> /etc/fstab

    echo "Active the swap"
    swapon -a

    echo "Remove swap warnings"
    read -r
    chmod 0600 "$localToCreateSwapFile/$swapFileName"
    chown root "$localToCreateSwapFile/$swapFileName"
    echo "Swap set"
else
    echo "Swap already set"
fi

#--------------------------- Create a kernel generic ------------------------------------
echo "Create the kernel generic"
read -r
/usr/share/mkinitrd/mkinitrd_command_generator.sh -r | /bin/bash
/usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-* >> /etc/lilo.conf

echo "Edit \"/etc/lilo.conf\"... enter to continue"
read -r

vi /etc/lilo.conf
echo "Update the lilo config"
read -r
lilo

#--------------------------- end --------------------------------------------------------
echo "End the script"

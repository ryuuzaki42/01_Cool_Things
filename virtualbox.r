
    ## VirtualBox ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 11/09/2025
#

## After install
    ## Add user in /etc/group to access USB
        nano /etc/group
            vboxuser: $user$

        ## Or
            usermod -a -G vboxusers $user$

        usermod -a -G vboxusers j

    ## Chance update settings for all releases
        File > preference > update > set : All New Realease

    ## Remove disable the start script
        # chmod -x /etc/init.d/vbox*
        chmod -x /etc/rc.d/init.d/vbox*

## VirtualBox start kernel service
    ## Edit the menu-start-shortcut
        ## Slackware KDE
            kdesu bash /etc/init.d/vboxdrv start; VirtualBox %U

        ## Slackware XFCE
            gksu bash /etc/init.d/vboxdrv start; VirtualBox %U

        ## Linux mint
            kdesudo bash /etc/init.d/vboxdrv start; VirtualBox %U

## Forum
    https://forums.virtualbox.org/index.php

    ## Using VirtualBox - Releases
        https://forums.virtualbox.org/viewforum.php?f=1

## Add to mount a "data partition"
    udisksctl mount -b /dev/sdXY

    udisksctl mount -b /dev/sda4

    ## Mount partition, start driver and run VirtualBox
    udisksctl mount -b /dev/sda4; kdesu bash /etc/init.d/vboxdrv start; VirtualBox %U

## After a Kernel upgrade - kernel driver not installed
    # The VirtualBox Linux kernel driver (vboxdrv) is either not loaded or there is a permission problem with /dev/vboxdrv.
    # Reinstall the kernel module by executing
        /sbin/vboxconfig

## VirtualBox - shrink VM size
    # https://vinyanalista.github.io/blog/2014/01/20/reduzindo-o-tamanho-de-discos-rigidos-virtuais-do-virtualbox/
    ## Write 0 in the vmDisk
        https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete

        sdelete -z c:

    ## Compact with VirtualBox
        VBoxManage modifyhd vmDisk.vdi --compact

        VBoxManage modifyhd Windows\ 7\ 64.vdi --compact

## VirtualBox define screen size
    vboxmanage setextradata 'VM Name' CustomVideoMode1 1366x768x32

## Share a folder in VirtualBox
     > Instal guest additions
        reboot

    ## On Gnu/Linux need to mount the folder
        mount -t vboxsf folder_share /media/folder

        mount -t vboxsf sda2 /media/sf_sda2/

## Error: cannot register existing type 'NMAgentManagerError'
    # At startup, VirtualBox checks for updates, disabling this check avoids the crash
    VBoxManage setextradata global GUI/UpdateDate never

## Error: another driver with the same name as the one being registered exists
    Remove/Upgrade the older Extension Pack before start the VM

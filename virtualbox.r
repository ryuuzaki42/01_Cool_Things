
    ## VirtualBox ##

#
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 21/06/2024
#

## Add user in /etc/group
    nano /etc/group
    vboxuser: $user$

    usermod -a -G vboxusers j

## Chance update settings for all releases
    File > preference > update > set : All New Realease

 ## Remove disable the start script
    # chmod -x /etc/init.d/vbox*

    chmod -x /etc/rc.d/init.d/vbox*

## Edit the menu-start-shortcut
    # Slackware KDE
        kdesu bash /etc/init.d/vboxdrv start; VirtualBox %U

    # Slackware XFCE
        gksu bash /etc/init.d/vboxdrv start; VirtualBox %U

    # Linux mint
        kdesudo bash /etc/init.d/vboxdrv start; VirtualBox %U

## Forum
    https://forums.virtualbox.org/index.php

    ## Using VirtualBox - Realeases
        https://forums.virtualbox.org/viewforum.php?f=1

## Add to mound "dados windows"
    udisksctl mount -b /dev/sda4

## Kernel upgrade (kernel driver not installed)
    # The VirtualBox Linux kernel driver (vboxdrv) is either not loaded or there is a permission problem with /dev/vboxdrv.
    # Please reinstall the kernel module by executing
        /sbin/vboxconfig

## Reduzir tamanho da VM
    # https://vinyanalista.github.io/blog/2014/01/20/reduzindo-o-tamanho-de-discos-rigidos-virtuais-do-virtualbox/
    ## Write 0 in the vmDisk
        https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete

        sdelete -z c:

    ## compact with VirtualBox
        VBoxManage modifyhd vmDisk.vdi --compact

        VBoxManage modifyhd Windows\ 7\ 64.vdi --compact

## Error
    (process:10352): GLib-GObject-WARNING **: 16:19:43.951: cannot register existing type 'NMAgentManagerError'
    (process:10352): GLib-CRITICAL **: 16:19:43.951: g_once_init_leave: assertion 'result != 0' failed
    (process:10352): GLib-GObject-WARNING **: 16:19:43.951: cannot retrieve class for invalid (unclassed) type '<invalid>'
    Segmentation fault

    VBoxManage setextradata global GUI/UpdateDate never

    At startup, Virtualbox checks for updates, disabling this check avoids the crash.

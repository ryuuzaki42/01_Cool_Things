
    ## Slackware_15.0_kernel_upgrade #

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 15/05/2026
#

## 1 Rebuilt initial ramdisck
    # Generate new initrd - /boot/initrd.gz

    pkgtool
        > Setup
            > 01.mkinitrd

    ## Or
        /usr/share/mkinitrd/mkinitrd_command_generator.sh -k "Kernel_Version" | bash

## 2 Update lilo
    > lilo

## 3 Reboot

## 4 VirtualBox
    /sbin/vboxconfig

    # ls -l /etc/rc.d/init.d/vbox*

    chmod -x /etc/rc.d/init.d/vbox*

    ls /lib/modules/

    rm -r /lib/modules/"OLD_Version"

    rm /tmp/vboxdrv-Module.symvers

## 5 Nvidia-kernel package upgrade
    https://github.com/ryuuzaki42/14_Nvidia_Driver_Slackware

    14_Nvidia_Driver_Slackware/final_packages/
        # nvidia-driver-*_multilib-x86_64-1_JB.txz - not need

        nvidia-kernel-*_"kernel"-x86_64-1_JB.txz

## 6 Reboot

## 7 Test Nvidia driver
        xrandr --listproviders
            Should display a provider named NVIDIA-G0 (for “NVIDIA GPU screen 0”)

        __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep "OpenGL vendor"
            Should display: "OpenGL vendor string: NVIDIA Corporation"

## 8 Clean system
    ## As root
        clean_tmp_folder_JBs.sh all

    ## As normal user
        clean_tmp_folder_JBs.sh all

    ## Remove old packages logs
        rm_old_logs_JBs.sh

    ## Trim SSD
        /etc/cron.weekly/fstrim_JBs.sh

---------------------------------------------------------------------

## 9 acpi_call package
    # https://github.com/teleshoes/acpi_call
    # https://github.com/nix-community/acpi_call/tags

    ## Not need
        1txz/TLP/need/
            acpi_call-1.2.2_"kernel"-x86_64-1_JB.txz

    tlp-stat -b

## 10 v4l2loopback
    OBS - Create "virtual video devices", in OBS Virtual Camera for example
    droidcam - need to work

    After install, need restart to start to working

    # https://slackbuilds.org/repository/15.0/system/v4l2loopback/
        v4l2loopback-0.13.2_"kernel"-x86_64-1_JB.txz

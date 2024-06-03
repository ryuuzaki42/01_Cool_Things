
    ## Android ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 26/04/2024
#

## Android APK
    ## Youtube ReVanced
        https://t.me/revanced_extended_chat

        ## MicroG - GmsCore
            https://github.com/YT-Advanced/GmsCore/releases

        ## ReVanced Manager
            https://revanced.app/download
                https://github.com/ReVanced/revanced-manager/releases

        1 Download and install MicroG - GmsCore
        2 Download and install Revanced Manager
            Maybe: Give The Three Permissions
                1 Notifications, 2 Ignore Battery Optimisation, 3 Display Over Other Apps

        3 Download the Official YouTube Apk Version 19.09.38 (From ApkMirror)
        4 Open Revanced Manager Open Settings, select Apk Of YouTube To Patch Select Default Patches
        5 Hit Patch. Share APK with Patches. Install APK
        6 Remove Revanced Manager

        ## Old
            ## ReVanced Extended
                https://revancedextended.com/
                https://github.com/NoName-exe/revanced-extended/releases

        ## Error during install?
            Remove the older version and try again

        ## After install
            Check if now do not have two apps. Remove the old one

        ## Configuration
            ## General
                Photo > Settings > General
                    > Remind break > 1 h
                    > Remind bedtime > 23:00 - 06:00
                    > Apearence > dark theme
                    > Playback in feeds > Off

            ## ReVanced Extended
                Photo > Settings > ReVanced Extended

                ## Bottom player
                    Hide download button > Enable

                ## Flyout menu
                    Enable old style quality layout
                        > Disable

                ## How to hide notification button
                    > Navigation > Switching the create and notification button > Disable

                ## Video
                    > Video > Default playback speed > 1.25x
                    > Disable playback speed in live stream > Disable

            ## Dislike button
                Photo > Settings > General
                    Return Youtube Dislike > Disable

----------------------------------------------------------------------------------------------------
## Android code
    ## Testing and some information (like apps use and device information)
        *#*#4636#*#*

    ## Show IMEI
        *#06#

----------------------------------------------------------------------------------------------------
## Android VM
    ## Download VM
        http://www.osboxes.org/android-x86/
            # Android-x86_4.4_r4 works good

    ## Configuration in the VM
        Version: Other Linux (32-bit)
        Boot order: only Hard disk
        Pointing Device: PS/2 Mouse
        Extended Features: Enable PAE/NX
        User Interface = Disable mouse integration

    ## Full screen
        # http://stackoverflow.com/questions/6202342/switch-android-x86-screen-resolution

        ## List VM running
            VBoxManage list runningvms

        ## Check your VM name and add a new resolution:
            VBoxManage setextradata "[YourVmNameHere]" "CustomVideoMode1" "800x480x16"
                # VBoxManage setextradata "Android-x86 4.4-r4" "CustomVideoMode1" "1366x768x16"

        ## Change the android load resolution
            Load VM in (Debub video=LVDS-1:d)

        ## Mount the partition boot
            mount /dev/sda1 /mnt

        ## Edit the file /mnt/grub/menu.lst
            ## ç is ;
            vi /mnt/grub/menu.lst

        ## And added in the frist kernel load entrer after android_x86
            UVESA_MODE=1366x768 DPI=160

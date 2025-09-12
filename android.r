
    ## Android ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 12/09/2025
#

## Android APK
        ## MicroG - GmsCore
            https://github.com/YT-Advanced/GmsCore/releases

        ## ReVanced Manager
            https://revanced.app/download
                https://github.com/ReVanced/revanced-manager/releases

        1 Download and install MicroG - GmsCore
        2 Download and install Revanced Manager
            Maybe: Give The Three Permissions
                1 Notifications, 2 Ignore Battery Optimisation, 3 Display Over Other Apps

        3 Download the Official YouTube Apk Version Needed (From ApkMirror) and install/update
        4 Open Revanced Manager, in Settings, select Apk Of YouTube To Patch, Select Default Patches
        5 Hit Patch. Share APK with Patches. Install APK
        6 Remove Revanced Manager

        ## Old
            ## ReVanced Extended
                https://revancedextended.com/
                https://github.com/NoName-exe/revanced-extended/releases

            ## Youtube ReVanced
                https://t.me/revanced_extended_chat

        ## Error during install?
            Remove the older version and try again

        ## After install
            Check if now do not have two apps. Remove the old one

        ## Configuration
            ## General
                Photo > Settings > General
                    > Remind break > 1 h
                    > Remind bedtime > 22:00 - 06:00
                    > Apearence > Dark theme
                    > Playback in feeds > Off
                    > Location > Brazil

                Playback > Picture-in-picture > Enable

                Background > Playback > Always on

            ## ReVanced
                Photo > Settings > ReVanced

                ## Seekbar color
                    Seekbar > Enable Custom Seekbar color
                        > Red

                ## Shorts
                    Shorts > Disable resuming shorts player

                ## Dislike button
                    Return YouTube Dislike button > Disable

                ## Start page and Disable Notification button
                    General >
                        Change star page > Library

                        Navigation button >
                            Switch Create with Notification > Disable

                ## End cards and Download button
                    Player
                        > Action buttons > Hide Download > Enable
                        > Hide end screen cards > Disable
                        > Video description
                            > Hide chapters > Disable
                            > Hide Info card section > Disable

                ## Video
                    Video >
                        Remenber video quality changes > Enable
                        Remenber Shorts quality changes > Enable
                        Remenber playback quality changes > Enable
                        Disable HDR video > Enable
                        Custom playback speed menu > Disable
                        Default playback speed > 1.25x

                        # Disable playback speed in live stream > Disable

                ## Videos play with auto-dubbed audio translations
                    https://github.com/ReVanced/revanced-documentation/blob/main/docs/revanced-resources/troubleshooting.md

                    ## Change to iOS TV
                        Settings > ReVanced > Miscellaneous > Spoof video streams
                            Default client > iOS TV

                    ## Enable spoofing to iOS TV
                        Settings > ReVanced > Video > Force original audio language

                ## ---

                ## Flyout menu
                    Enable old style quality layout
                        > Disable

                ## How to hide notification button
                    > Navigation > Switching the create and notification button > Disable

## Mirror Android screen on PC over USB or TCP/IP
    # Allows to control the device with the keyboard and the mouse of the computer
    # It does not require any root access. It works on Linux, Windows and macOS
    ## https://github.com/Genymobile/scrcpy

    ## Install scrcpy and adb

        ## Or use an AppImage
            https://github.com/ardevd/scrcpy-appimage

    ## On Android device - Enable Developer Options
        # https://alien.slackbook.org/blog/using-your-slackware-to-control-your-android/
        > "Settings" > "About phone" or "About Tablet"
            > "Build number"

        Repeatedly, tap the "Build number" line. After a couple of taps, a popup message
        tells you that you are an "X amount" of clicks away from becoming a Developer.
        As you keep tapping the number "X" will decrease to zero which completes the process.

        In the new Developer Options menu you will find "ADB debugging" which you have to enable.

    ## Connect the Android device over USB cable
        ## List devices
            adb devices

        ## Run scrcpy
            scrcpy

    ## Connect to android device over Wi-FI
        # https://www.genymotion.com/blog/open-source-project-scrcpy-now-works-wirelessly/

        Connect the device to the same Wi-Fi as your computer
        Get your device IP address (in Settings → About phone → Status)
        Enable adb over TCP/IP on your device:
            adb tcpip 5555

        Connect to your device:
            adb connect DEVICE_IP:5555 (replace DEVICE_IP)

            adb connect 192.168.0.103:5555

        Run scrcpy as usual and unplug the device

        ## To switch back to USB mode
            adb usb

    ## Connect by AppImage
        Extract AppImage
        cd usr/bin

        ## As root
        ./adb tcpip 5555

        ./adb connect 192.168.0.103:5555
            ## Allow USB debugging
                RSA key fingerprint

        ## Normal user
        ../../AppRun

            ## Or
                scrcpy*.AppImage

    ## Stop server
        # ./adb start-server
        ./adb kill-server
        ./adb disconnect 192.168.0.103:5555

## Deleted files still show in Google Files, also in other apps
    Stop the app
    Clear cache
    Play Store > Google Files > unistall updates

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

        ## And added in the first kernel load enter after android_x86
            UVESA_MODE=1366x768 DPI=160

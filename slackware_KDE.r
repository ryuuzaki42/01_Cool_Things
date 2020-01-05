    ## Slackware_K45A_KDE.r to Slackware 14.2 ##
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 05/01/2020
#

## Edit files in the /etc/
    nano /etc/lilo.conf /etc/fstab /etc/inittab /etc/profile.d/lang.*sh /etc/acpi/acpi_handler.sh

## Remove autostart programs
    /etc/xdg/autostart
    /usr/share/autostart/

    nano ~/.config/akonadi/akonadiserverrc
        StartServer=true > StartServer=false

## Disable Hibernation
    nano /usr/share/polkit-1/actions/org.freedesktop.upower.policy
        <action id="org.freedesktop.upower.hibernate">
            <allow_active>yes</allow_active>
                yes > no

## rc.local
    ## Download boot_rcLocal_JBs and copy to /usr/bin/
        git clone https://github.com/ryuuzaki42/2_scripts_slackware/blob/master/boot_rcLocal_JBs.sh

        ## Set to run on the boot
            echo "/usr/bin/boot_rcLocal_JBs.sh" >> /etc/rc.d/rc.local

    ## My final rc.local
#!/bin/sh
#
# /etc/rc.d/rc.local: Local system initialization script.
#
# Put any local startup commands in here. Also, if you have
# anything that needs to be run at shutdown time you can
# make an /etc/rc.d/rc.local_shutdown script and put those
# commands in there.
#
echo -e "\\nStarting tlp\\n"
# https://github.com/linrunner/TLP
/etc/rc.d/rc.tlp start
#
echo -e "\\nStarting boot_rcLocal_JBs.sh\\n"
/usr/bin/boot_rcLocal_JBs.sh
#
# If your backlight keyboard doesn't work
echo -e "\\nStarting UPower\\n"
qdbus --system org.freedesktop.UPower
#
# If you have installed Nvidia video driver with bumblebeed
echo -e "\\nStarting bumblebeed\\n"
/etc/rc.d/rc.bumblebeed start
#
# Disable bluetooth
rfkill block bluetooth
#
echo -e "\\nStarting thinkfan\\n"
# https://github.com/vmatare/thinkfan
/etc/rc.d/rc.thinkfan start
#

## Kernel Generic
    #https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel

    /usr/share/mkinitrd/mkinitrd_command_generator.sh -r | /bin/bash
    /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-* >> /etc/lilo.conf
    nano /etc/lilo.conf
    lilo

## Touchpad of just one part
    nano /etc/X11/xorg.conf

Section "InputClass"
Identifier "Clickpad buttons"
MatchDriver "synaptics"
Option "SoftButtonAreas" "50% 0 82% 0 0 0 0 0"
EndSection

## Thinkpad - TrackPoint enable scrolling with middle button
    # https://wiki.debian.org/InstallingDebianOn/Thinkpad/Trackpoint
    ## To enable vertical scrolling
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

    ## To enable horizontal scrolling in addition to vertical scrolling
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

## Dolphin disable executable shellscript, perl, ruby, pyton etc
    kdesu kwrite /usr/share/mime/packages/freedesktop.org.xml

    ## Look for the lines and comment # with " " and ' '
        <sub-class-of type="application/x-executable"/>
        <!-- <sub-class-of type="application/x-executable"/> -->

        <sub-class-of type='application/x-executable'/>
        <!-- <sub-class-of type='application/x-executable'/> -->

    ## Update Dolphin config
        rm /usr/share/mime/packages/kde.xml
        update-mime-database /usr/share/mime

## Remove keyboard shortcut "Plasma Desktop Shell: Stop Current Activity"
    Is assigned meta (windows) + S
    System Settings > Shortcuts and Gestures > Global Keyboard Shortcuts
    Select "Plasma Desktop Shell" in KDE component,and in Action Remove the shortcut to "Stop Current Activity"

## Libreoffice to Brazil user on KDE
    slackpkg install libreoffice-5.* libreoffice-dict-en libreoffice-dict-pt-BR libreoffice-l10n-pt_BR libreoffice-kde-integration
    ## libreoffice - install cogroo and change the language configuration

## Install local packages/programs
    dropbox virtualbox comix qpdf R redshift smplayer vlc openjdk ...

## Latex
    ## Remove tetex and tetex-doc
        slackpkg remove tetex

    ## If will install the txz texlive
        ## Install libsigsegv texi2html
        ## Install texlive local

    ## Remove the last texlive (latex) version (if has one)
        tlmgr uninstall

        ## Delete de older folder
            cd /usr/local
            rm -r texlive

    ## Download and install by the ISO file
        https://www.tug.org/texlive/acquire-iso.html

    ## Mount dvd to install
        mount texlive*.iso /media/dvd/
        /media/dvd/install-tl
            ## Set A4 paper and symlinks on directory

    ## If the command latex is "not found"
        ## Added in .bashrc (look the year/version)
        export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-linux

    ## Update packets
        tlmgr update --self
        tlmgr update --all

    ## Change mirror and correct some errors
        tlmgr update --self --all

    ## To install one package
        tlmgr install package

## Remove games of KDE
    slackpkg remove palapeli bomber granatier kblocks ksnakeduel kbounce kbreakout kgoldrunner kspaceduel kapman kolf kollision kpat lskat blinken khangman pairs ktuberling
    slackpkg remove kdiamond ksudoku kubrick picmi bovo kblackbox kfourinline kmahjongg kreversi ksquares kigo kiriki kshisen gnuchess katomic kjumpingcube kmines knetwalk
    slackpkg remove killbots klickety klines konquest ksirk knavalbattle kanagram amor kajongg

## Remove desktop environments (X)
    ## Remove all another X than KDE (leave fluxbox for safe propose)
        slackpkg remove twm blackbox windowmaker fvwm xfce

    ## Set one to be the default
        xwmconfig

## Remove kopote
    slackpkg remove kdenetwork kdenetwork-filesharing kdenetwork-strigi-analyzers kopete

## Remove nepomuk
    slackpkg remove nepomuk nepomuk-core nepomuk-widgets

## Remove akonadi
    slackpkg remove akonadi

## Remove gnome "packages"
    slackpkg remove gcr polkit-gnome gnome-themes gnome-keyring libgnome-keyring

## Remove bluetooth - not recommended if you have bluetooth 
    slackpkg remove bluedevil blueman bluez bluez-firmware

## Remove others
    slackpkg remove seamonkey pidgin xchat dragon thunderbird kplayer calligra
    slackpkg remove xine-lib xine-ui vim-gvim vim sendmail sendmail-cf xpdf tetex tetex-doc kget

        ## Dolphin need baloo baloo-widgets

    ## KDE5 (ktown AlienBob) - AC Power need the bluez-qt
        slackpkg install bluez-qt

## Swap in file 
    swapfilePace="/media/sda2/home/ryuuzaki42"

    ## Create the file # 8 GiB = 8192 # 6 GiB = 6144 # 4 GiB = 4096 # 2 GiB = 2048
        dd if=/dev/zero of=$swapfilePaceswapfile.img bs=1M count=2048 # 2 GiB

    ## Turn into swapfile
        mkswap $swapfilePaceswapfile.img

    ## Add config in the fstab
        echo "$swapfilePace/swapfile.img swap swap defaults    0   0" >> /etc/fstab

    ## test the swap
        swapon -a

    ## resolve the warnings
        chmod 0600 $swapfilePace/swapfile.img
        chown root $swapfilePace/swapfile.img

## See the actual value of swappiness
    cat /proc/sys/vm/swappiness

    ## To temporarily set the swappiness value
        sysctl -w vm.swappiness=10

    ## To set the swappiness value permanently, edit a sysctl configuration file
        nano /etc/sysctl.conf
            ## Add in the file
                vm.swappiness=10

    ## Load configuration permanently
        sysctl –p

## Set slackpkg mirror - Take a look in this script
    ./mirrors_insert_JBs.sh

## Move windows between Desktop
    ## Add 4 Desktop

    ## Add shortcuts
        System Settings > Shortcuts and Gestures > Global Keyboard Shortcuts
        Selecting "KWin"
        Search for "one"

        Switch One Desktop Down         ## Ctrl + Alt + Down
        Switch One Desktop to the Left  ## Ctrl + Alt + Left
        Switch One Desktop to the Right ## Ctrl + Alt + Right
        Switch One Desktop Up           ## Ctrl + Alt + Up

        Window One Desktop Down         ## Ctrl + Alt + Shift + Down
        Window One Desktop to the Left  ## Ctrl + Alt + Shift + Left
        Window One Desktop to the Right ## Ctrl + Alt + Shift + Right
        Window One Desktop Up           ## Ctrl + Alt + Shift + Up

## If use multilib, add package gcc and glibc to not upgrade
    ## If you use slackpkgplus is not needed add to greylist or blacklist
        If two or more repositories contains some same packages, you can specify
        from which repository you prefer to search it.

        ## Just add a PKGS_PRIORITY to the mirror multilib
            PKGS_PRIORITY=( multilib )

    ## In the blacklist file
        # Any packages listed here won't be upgraded, removed, or installed by slackpkg
        nano /etc/slackpkg/blacklist

    ## Or in the greylist
        # All packages in that list will be showned but unchecked by default 
        nano /etc/slackpkg/greylist

gcc
glibc

## slackpkg mirrors - local clone (https://github.com/ryuuzaki42/2_clone_Slackware_repo)
    nano /etc/slackpkg/mirrors

    ## Local mirror stable
        file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-14.2/

    ## Local mirror current
        # file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-current/

## slackpkg+ mirrors
    nano /etc/slackpkg/slackpkgplus.conf

    ## 14.2 stable
        MIRRORPLUS['multilib']=http://bear.alienbase.nl/mirrors/people/alien/multilib/14.2/
        MIRRORPLUS['alienbob']=http://bear.alienbase.nl/mirrors/people/alien/sbrepos/14.2/x86_64/
        MIRRORPLUS['restricted']=http://bear.alienbase.nl/mirrors/people/alien/restricted_sbrepos/14.2/x86_64/

    ## Current
        MIRRORPLUS['multilib']=http://bear.alienbase.nl/mirrors/people/alien/multilib/current/
        MIRRORPLUS['alienbob']=http://bear.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/
        MIRRORPLUS['restricted']=http://bear.alienbase.nl/mirrors/people/alien/restricted_sbrepos/current/x86_64/

    ## Others 14.2 stable
        MIRRORPLUS['slacky']=http://repository.slacky.eu/slackware64-14.2/
        MIRRORPLUS['rlworkman']=http://rlworkman.net/pkgs/14.2/x86_64/

## Personal choice
    mv /usr/bin/vi /usr/bin/vi2 # Rename elvis link to vi2

## If has SSD - fstrim
    # http://rra.etc.br/MyWorks/2017/03/18/fstrim-ou-discard-em-ssd-no-gnulinux/
    ## Change the "SSD_MOUNT" for your partition mount folder
        ## For me weekly is enough
        cp doFstrim.sh /etc/cron.weekly/
            ## To test:
            /etc/cron.weekly/doFstrim.sh

    ## See all add
        crontab -l

    ## Run weekly cron jobs at 4:30 on the first day of the week:
        30 4 * * 0 /usr/bin/run-parts /etc/cron.weekly 1> /dev/null

    ## Edit cron and set to run weekly at 19:00 on the first day of the week:
        0 19 * * 0 /usr/bin/run-parts /etc/cron.weekly 1> /dev/null

    # * * * * * command to execute
    # │ │ │ │ └─ day of week (0 - 6) (Sun(0) /Mon (1)/Tue (2)/Wed (3)/Thu (4)/Fri (5)/Sat (6))
    # │ │ │ └─ month (1 - 12)
    # │ │ └─ day of month (1 - 31)
    # │ └─ hour (0 - 23)
    # └─ min (0 - 59)

    ## Slackware_K45A_KDE.r to Slackware 14.2 ##

## Edit
    nano /etc/lilo.conf
    nano /etc/fstab
    nano /etc/inittab
    nano /etc/profile.d/lang.*sh
    nano /etc/acpi/acpi_handler.sh

## Remove autostart
    /etc/xdg/autostart

    /usr/share/autostart/

    nano /home/j/.config/akonadi/akonadiserverrc
    StartServer=true > StartServer=false

## Disable Hibernation
    nano /usr/share/polkit-1/actions/org.freedesktop.upower.policy

        <action id="org.freedesktop.upower.hibernate">
            <allow_active>yes</allow_active>
                yes > no

## rc.local
    ## Download boot_rcLocal_JBs and copy to /usr/bin/
    https://github.com/ryuuzaki42/5_scripts_slackware/blob/master/boot_rcLocal_JBs.sh

    ## Set to run at the startup
    echo "/usr/bin/boot_rcLocal_JBs.sh" >> /etc/rc.d/rc.local

## Kernel Generic
    # https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel

    /usr/share/mkinitrd/mkinitrd_command_generator.sh | grep mkinitrd | grep -v command | /bin/bash

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

## Dolphin disable executable shellscript, perl, ruby, pyton etc
    kdesu kwrite /usr/share/mime/packages/freedesktop.org.xml

    ## Look for the lines and comment
        <sub-class-of type="application/x-executable"/>
        <!-- <sub-class-of type="application/x-executable"/> -->

    ## And
        <sub-class-of type='application/x-executable'/>
        <!-- <sub-class-of type='application/x-executable'/> -->

    ## Update Dolphin config
        rm /usr/share/mime/packages/kde.xml
        update-mime-database /usr/share/mime

## Remove keyboard shortcut "Plasma Desktop Shell: Stop Current Activity"
    Is assigned meta (windows) + S
    System Settings > Shortcuts and Gestures > Global Keyboard Shortcuts
    Select "Plasma Desktop Shell" in KDE component,and in Action Remove the shortcut to "Stop Current Activity"

## Install slackpkg
    slackpkg install flash-player-plugin p7zip unrar chrome
    slackpkg install icedtea-web libreoffice-5.* libreoffice-dict-en libreoffice-dict-pt-BR libreoffice-l10n-pt_BR libreoffice-kde-integration
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

## Remove games
    ## Part 1
    slackpkg remove palapeli bomber granatier kblocks ksnakeduel kbounce kbreakout kgoldrunner kspaceduel kapman kolf kollision kpat lskat blinken khangman pairs ktuberling

    ## Part 2
    slackpkg remove kdiamond ksudoku kubrick picmi bovo kblackbox kfourinline kmahjongg kreversi ksquares kigo kiriki kshisen gnuchess katomic kjumpingcube kmines knetwalk

    ## Part 3
    slackpkg remove killbots klickety klines konquest ksirk knavalbattle kanagram amor kajongg

## Remove desktop environments (X)
    ## Remove all another X than KDE (leave fluxbox for safe propose)
        slackpkg remove twm blackbox windowmaker fvwm xfce

    ## Set one by be the default
        xwmconfig

## Remove kopote
    slackpkg remove kdenetwork kdenetwork-filesharing kdenetwork-strigi-analyzers kopete

## Remove nepomuk
    slackpkg remove nepomuk nepomuk-core nepomuk-widgets

## Remove akonadi
    slackpkg remove akonadi

## Remove ktorrent
    slackpkg remove ktorrent libktorrent

## Remove gnome "packages"
    slackpkg remove gcr polkit-gnome gnome-themes gnome-keyring libgnome-keyring

## Remove others
    ## Part 1
    slackpkg remove seamonkey pidgin xchat dragon thunderbird kplayer calligra bluedevil blueman bluez bluez-firmware

    ## Part 1
    slackpkg remove xine-lib xine-ui vim-gvim vim sendmail sendmail-cf xpdf tetex tetex-doc kget

    ## Dolphin need baloo baloo-widgets

## Swap in file
    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=8192 # 8 GiB = 8192

    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=6144 # 6 GiB = 6144

    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=4096 # 4 GiB = 4096

    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=2048 # 2 GiB = 2048

    mkswap /home/j/swapfile.img
    nano /etc/fstab

/home/j/swapfile.img swap         swap        defaults         0   0

#/media/sda2/prog/swapfile.img swap swap       defaults         0   0

    swapon -a

    ## warnings
    chmod 0600 /home/j/swapfile.img
    chown root /home/j/swapfile.img

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
    System Settings > Shortcuts and Gestures >  Global Keyboard Shortcuts
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

## Blacklist (slackpkg)
    nano /etc/slackpkg/blacklist

ffmpeg
kdenlive
ladspa_sdk
libquicktime
libwebp
mkvtoolnix
orc
schroedinger
smplayer
swfdec
wxPython
x264
xerces-c
bleachbit
glib2
xf86-video-intel
glib

## slackpkg mirrors
nano /etc/slackpkg/mirrors

    ## Local mirror stable
    file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-14.2/

    ## Local mirror current
    file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-current/

## slackpkg+ mirrors
nano /etc/slackpkg/slackpkgplus.conf

    #MIRRORPLUS['multilib']=http://bear.alienbase.nl/mirrors/people/alien/multilib/14.2/
    # MIRRORPLUS['slacky']=http://repository.slacky.eu/slackware64-14.2/
    # MIRRORPLUS['rlworkman']=http://rlworkman.net/pkgs/14.2/x86_64/

    ## Stable
    MIRRORPLUS['alienbob']=http://bear.alienbase.nl/mirrors/people/alien/sbrepos/14.2/x86_64/
    MIRRORPLUS['restricted']=http://bear.alienbase.nl/mirrors/people/alien/restricted_sbrepos/14.2/x86_64/

    ## Current
    MIRRORPLUS['alienbob']=http://bear.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/
    MIRRORPLUS['restricted']=http://bear.alienbase.nl/mirrors/people/alien/restricted_sbrepos/current/x86_64/

## Personal choice
    mv /usr/bin/vi /usr/bin/vi2 # Rename elvis link to vi2

## If has SSD - fstrim
    # http://rra.etc.br/MyWorks/2017/03/18/fstrim-ou-discard-em-ssd-no-gnulinux/

    ## Change the "SSD_MOUNT" for your partition mount folder 
        # For me weekly is enough
    cp do_fstrim.sh /etc/cron.weekly/
        # To test:
        /etc/cron.weekly/do_fstrim.sh

    # See all add
    crontab -l

    # Run weekly cron jobs at 4:30 on the first day of the week:
    30 4 * * 0 /usr/bin/run-parts /etc/cron.weekly 1> /dev/null

    # * * * * * command to execute
    # │ │ │ │ └─ day of week (0 - 6) (Sun(0) /Mon (1)/Tue (2)/Wed (3)/Thu (4)/Fri (5)/Sat (6))
    # │ │ │ └─ month (1 - 12)
    # │ │ └─ day of month (1 - 31)
    # │ └─ hour (0 - 23)
    # └─ min (0 - 59)

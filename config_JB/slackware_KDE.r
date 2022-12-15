    ## Slackware_KDE.r to Slackware 14.2, 15.0 and current ##
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 14/12/2022
#

## Make home folder - mount /media/sda2
mkdir /media/sda2
chmod 777 /media/sda2

nano /etc/fstab
/dev/sda2        /media/sda2      ext4        defaults         1   2

## Edit files in the /etc/
nano /etc/lilo.conf /etc/fstab /etc/inittab /etc/profile.d/lang.*sh /etc/acpi/acpi_handler.sh

## Remove autostart programs
cd /etc/xdg/autostart/
cd /usr/share/autostart/

nano ~/.config/akonadi/akonadiserverrc
StartServer=true > StartServer=false

## Copy <install> configs ## Configuration files to update in the system
    ## lilo.conf
cp config_JB/lilo.conf_JBc /etc/lilo.conf

    ## mirrors
cp config_JB/mirrors_slackpkg_15.0_JBc /etc/slackpkg/mirrors

    ## greylist
cp config_JB/greylist_slackpkg_JBc /etc/slackpkg/greylist

    ## slackpkgplus.conf
cp config_JB/slackpkgplus.conf_15.0_JBc /etc/slackpkg/slackpkgplus.conf

    ## rc.local
cp config_JB/rc.local_JBs.sh /etc/rc.d/rc.local

## Compare JB config
check_file(){
    file1=$1
    file2=$2

    echo -e "\\n    # diff -s $file1 $file2 #\\n"
    diff -s $file1 $file2
}

files_check=("config_JB/doFstrim_JBs.sh" "/etc/cron.weekly/doFstrim_JBs.sh"
"config_JB/greylist_slackpkg_JBc" "/etc/slackpkg/greylist"
"config_JB/kde_start_JBs.sh" "~/.config/kde_start_JBs.sh"
"config_JB/lilo.conf_JBc" "/etc/lilo.conf"
"config_JB/mirrors_slackpkg_15.0_JBc" "/etc/slackpkg/mirrors"
"config_JB/rc.local_JBs.sh" "/etc/rc.d/rc.local"
"config_JB/slackpkgplus.conf_15.0_JBc" "/etc/slackpkg/slackpkgplus.conf")

count_files=${#files_check[*]}
i=0
while [ "$i" -lt "$count_files" ]; do
    check_file "${files_check[i]}" "${files_check[$i+1]}"
    i=$((i + 2))
done

## Reduce/Remove electric noise when running Slackware
    # https://www.linuxquestions.org/questions/slackware-14/strange-electric-noise-when-running-slackware-4175682884/

    ## Make sure /etc/rc.d/rc.cpufreq is executable
        chmod +x /etc/rc.d/rc.cpufreq

    ## Edit /etc/default/cpufreq and set the desired CPU governor at boot time
        nano /etc/default/cpufreq

        SCALING_GOVERNOR=powersave

    ## Good commands
        cpufreq-info

        cpufreq-info | grep driver

        cpufreq-info | grep "governor"

        lsmod

## Kernel Generic
    # https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel

    /usr/share/mkinitrd/mkinitrd_command_generator.sh -r | /bin/bash
    /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-* >> /etc/lilo.conf
    nano /etc/lilo.conf
    lilo

    ## Slackware 15.0 and current
        pkgtool
            > Setup - Choose Slackware installation scripts to run again
                > 01.mkinitrd - Generate /boot/initrd.gz for the generic Kernel

        ## Edit link in lilo.conf "vmlinuz-generic-..." to "vmlinuz-generic"
            lilo

## Touchpad of just one part
    nano /etc/X11/xorg.conf

Section "InputClass"
Identifier "Clickpad buttons"
MatchDriver "synaptics"
Option "SoftButtonAreas" "50% 0 82% 0 0 0 0 0"
EndSection

## KDE autostart and lock
    ## Copy the script to ~/.config/
    cp config_JB/kde_start_JBs.sh ~/.config/

    ## Added to Autostart script on KDE
        System Settings > Startup and Shutdown > Autostart > Add... > Add Login Script...
            > select the file in the path ~/.config/

## Thinkpad - TrackPoint enable scrolling with middle button
    # https://wiki.debian.org/InstallingDebianOn/Thinkpad/Trackpoint
    # Add in file kde_start_JBs.sh

    ## To enable vertical scrolling
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

    ## To enable horizontal scrolling in addition to vertical scrolling
        xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

## xbacklight - error - "No outputs have backlight property"
    # https://wiki.archlinux.org/title/backlight#xbacklight
    ## Added the file 20-intel.conf
nano /etc/X11/xorg.conf.d/20-intel.conf

Section "Device"
    Identifier  "Intel Graphics" 
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection

    ## If you use/have a Intel graphics card, can select which driver load/use
        nano /etc/X11/xorg.conf

        ## To the use Intel - xbacklight works
Section "Device"
    Identifier      "Intel Graphics"
    Driver          "intel"
EndSection

        ## Can add Option Backlight after driver
Option          "Backlight"      "intel_backlight"

        ## To use modesetting - xbacklight not works
Section "Device"
    Identifier      "Intel Graphics"
    Driver          "modesetting"
EndSection

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

## Remove keyboard shortcut Plasma: "Stop Current Activity"
    ## Path KDE 5
        System Settings > Shortcuts > Shortcuts >
        Search for "Plasma"
        On the list of shortcut select "Stop Current Activity"
        Unmark Meta (windows) + S

## Swap in file
    ## Add the /path/to/folder/ - with the and /
        # My full path file: /swapFile.img
swapFilePace="/"

    ## Create the file # 8 GiB = 8192 # 6 GiB = 6144 # 4 GiB = 4096 # 2 GiB = 2048
dd if=/dev/zero of=${swapFilePace}swapFile.img bs=1M count=4096 # 4 GiB

    ## Turn into swapfile
mkswap ${swapFilePace}swapFile.img

    ## Add config in the fstab
echo "${swapFilePace}swapFile.img swap swap defaults 0 0" >> /etc/fstab

    ## test the swap
swapon -a

    ## resolve the warnings
chmod 0600 ${swapFilePace}swapFile.img
chown root ${swapFilePace}swapFile.img

    ## See the actual value of swappiness
        cat /proc/sys/vm/swappiness

        ## To temporarily set the swappiness value
            sysctl -w vm.swappiness=10

        ## To set the swappiness value permanently, edit a sysctl configuration file
            nano /etc/sysctl.conf
                ## Add in the file
                    vm.swappiness=10

        ## Load configuration permanently
            sysctl -p

## If has SSD - fstrim - add to crontab
    # http://rra.etc.br/MyWorks/2017/03/18/fstrim-ou-discard-em-ssd-no-gnulinux/
    ## Change the "SSD_MOUNT" in the scrpit for your partition mount folder
        # For me, weekly is enough
        cp config_JB/doFstrim_JBs.sh /etc/cron.weekly/


        ## To test:
            /etc/cron.weekly/doFstrim_JBs.sh

    ## See all add
        crontab -l

    ## Run weekly cron jobs at 4:30 on the first day of the week:
        30 4 * * 0 /usr/bin/run-parts /etc/cron.weekly 1> /dev/null

    ## Edit cron and set to run weekly at 19:00 on the first day of the week
        ## To edit crontab
            crontab -e

        0 19 * * 0 /usr/bin/run-parts /etc/cron.weekly 1> /dev/null

    # * * * * * command to execute
    # │ │ │ │ └─ day of week (0 - 6) (Sun(0) /Mon (1)/Tue (2)/Wed (3)/Thu (4)/Fri (5)/Sat (6))
    # │ │ │ └─ month (1 - 12)
    # │ │ └─ day of month (1 - 31)
    # │ └─ hour (0 - 23)
    # └─ min (0 - 59)

## To disable the fortune in /etc/profile.d/ use:
    # When change from "nornmal" user to root
chmod -x /etc/profile.d/bsd-games-login-fortune.*sh

## Remove games of KDE
    slackpkg remove palapeli bomber granatier kblocks ksnakeduel kbounce kbreakout kgoldrunner kspaceduel kapman kolf
    slackpkg remove kollision kpat lskat blinken khangman pairs ktuberling katomic kjumpingcube kmines knetwalk
    slackpkg remove kdiamond ksudoku kubrick picmi bovo kblackbox kfourinline kmahjongg kreversi ksquares kigo kiriki kshisen
    slackpkg remove killbots klickety klines konquest ksirk knavalbattle kanagram amor kajongg xsnow libgtop

    ## knights need gnuchess
        slackpkg remove knights gnuchess

## Remove plasma-vault
    slackpkg remove plasma-vault

## Remove desktop environments (X)
    ## Remove all another X than KDE (leave fluxbox for safe propose)
        slackpkg remove twm blackbox windowmaker fvwm xfce motif

    ## Set one to be the default
        xwmconfig

## Remove kopote
    slackpkg remove kdenetwork kdenetwork-filesharing kdenetwork-strigi-analyzers kopete

## Remove nepomuk
    slackpkg remove nepomuk nepomuk-core nepomuk-widgets

## Remove akonadi* akonadiconsole kalarm
    slackpkg remove akonadi akonadi-calendar akonadi-calendar-tools akonadi-contacts akonadi-notes
    slackpkg remove akonadi-import-wizard akonadi-mime akonadi-search akonadiconsole kalarm

    ## digikam need akonadi-contacts
        slackpkg remove digikam

## Remove kde-l10n- - others languages for the KDE
    slackpkg remove kde-l10n-

## Remove some added to XFCE
    slackpkg remove elementary-xfce gnome-themes-extra xfce4-panel-profiles xfce4-screensaver xfce4-whiskermenu-plugin thunar mousepad Greybird

## Remove gnome "packages"
    slackpkg remove gcr polkit-gnome gnome-themes gnome-keyring libgnome-keyring

## Remove Bluetooth
    ## Not recommended if you have Bluetooth
        slackpkg remove bluedevil blueman bluez-firmware bluez

## Remove kleopatra
    slackpkg remove kleopatra

## Remove others
    slackpkg remove seamonkey pidgin xchat dragon thunderbird kplayer calligra xine-lib xine-ui
    slackpkg remove emacs amarok audacious vim-gvim vim sendmail-cf sendmail xpdf kget

        ## Dolphin need baloo baloo-widgets
            slackpkg install baloo-widgets

        ## xxd (to see file as binary - xxd -b file - is in vim
            slackpkg install vim-gvim vim

        ## KDE5 (ktown AlienBob) - AC Power need the bluez-qt
            slackpkg install bluez-qt

## Remove tetex (Slackware 14.2) / texlive (Slackware 15.0 and Current)
    slackpkg remove tetex-doc tetex texlive

## Clipboard KDE - change to ignore text selection
    Panel > Icon "Status and Notifications" > Clipboard
        > In the up "Configure Clipboard" icon > General
            > Change to "Ignore selection"

## Disable Hibernation
    ## KDE4
        nano /usr/share/polkit-1/actions/org.freedesktop.upower.policy
            <action id="org.freedesktop.upower.hibernate">
                <allow_active>yes</allow_active>
                    yes > no

    ## KDE 5
        nano /usr/share/polkit-1/actions/org.freedesktop.login1.policy
            # line 288
            <action id="org.freedesktop.login1.hibernate">
                <allow_active>yes</allow_active>
                    yes > no

            # line 298
            <action id="org.freedesktop.login1.hibernate-multiple-sessions">
                <allow_active>yes</allow_active>
                    yes > no

## Others - old ------------------------------------------------------------------------------------------------------------------------------------------------ ##

## Set slackpkg mirror - Take a look in this script
    mirrors_insert_JBs.sh

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

## slackpkg mirrors - local clone (https://github.com/ryuuzaki42/12_clone_Slackware_repo_rsync)
    nano /etc/slackpkg/mirrors

    ## Local mirror stable
        file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-15.0/

    ## Local mirror current
        # file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-current/

## slackpkg+ mirrors (old - to update list see the file slackpkgplus.conf_*)
    nano /etc/slackpkg/slackpkgplus.conf

    ## 14.2
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

## KDE 5 resize the "start menu"/Kickoff
    ## Kickoff was redesign/update in KDE 5.21, need to install the legacy kickoff
        https://store.kde.org/p/1468103

    ## KDE widget default widgets located at:
        /usr/share/plasma/plasmoids/

        ## Local user
        ~/.local/share/plasma/plasmoids/

    ## KDE 5 resize the "start menu"/Kickoff
        ## Before KDE 5.21
            nano /usr/share/plasma/plasmoids/org.kde.plasma.kickoff/contents/ui/FullRepresentation.qml

        ## After (need to install)
            ## As your user
            nano ~/.local/share/plasma/plasmoids/org.kde.plasma.kickofflegacy/contents/ui/FullRepresentation.qml

    # line 34
    Layout.minimumWidth: units.gridUnit * 26
    > 26 to 22

    Layout.minimumHeight: units.gridUnit * 34
    > 34 to 28

## rc.local
    ## Download boot_rcLocal_JBs and copy to /usr/bin/
        git clone https://github.com/ryuuzaki42/2_scripts_slackware/blob/master/boot_rcLocal_JBs.sh

        ## Set to run on the boot
            cp 2_scripts_slackware/others/boot_rcLocal_JBs.sh /usr/bin/
            echo "/usr/bin/boot_rcLocal_JBs.sh" >> /etc/rc.d/rc.local

    ## My final rc.local
        See the file ./rc.local

## Change cpufreq with script
countCPU=$(cpufreq-info | grep -c "analyzing CPU")

i=0
while [ "$i" -lt "$countCPU" ]; do
    cpufreq-set --cpu $i --governor powersave;
    echo "cpufreq-set --cpu $i --governor powersave"
    ((i++))
done

## Libreoffice to Brazil user on KDE
    slackpkg install libreoffice-[0-9].* libreoffice-dict-en libreoffice-dict-pt-BR libreoffice-l10n-pt_BR
    	# libreoffice-kde-integration - no more
    ## libreoffice - install cogroo and change the language configuration

## Install local packages/programs
    dropbox virtualbox comix qpdf smplayer vlc openjdk ...

## Latex
    ## Alternative, you can use latex online
        # https://www.overleaf.com/

    ## Slackware 15.0 and current has texlive package, but without tlmgr
        # In texlive-*.txz/usr/doc/texlive-*/README.tlpkg
            "The TeXLive Package Manager, i.e. tlmgr(1), is not shipped with this
            TeXLive package, as it's not expected to work properly (if at all)."

        slackpkg remove texlive

    ## To Slackware 14.2
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
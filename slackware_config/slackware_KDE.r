
    ## Slackware_KDE.r to Slackware 14.2, 15.0 and current ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 05/06/2024
#

## Make home folder - mount /media/sda2
mkdir /media/sda2
chmod 755 /media/sda2
chown j /media/sda2 -R

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
cp lilo.conf_JBc /etc/lilo.conf

    ## mirrors
cp mirrors_slackpkg_15.0_JBc /etc/slackpkg/mirrors

    ## greylist
cp greylist_slackpkg_JBc /etc/slackpkg/greylist

    ## slackpkgplus.conf
cp slackpkgplus.conf_15.0_JBc /etc/slackpkg/slackpkgplus.conf

    ## rc.local
cp rc.local_JBs.sh /etc/rc.d/rc.local

## Compare JB config
check_file() {
    #command_run="sdiff -s $1 $2"
    command_run="ss $1 $2"
    echo -e "\n # $command_run #"
    eval "$command_run"
}

files_check=("fstrim_JBs.sh" "/etc/cron.weekly/fstrim_JBs.sh"
"greylist_slackpkg_JBc" "/etc/slackpkg/greylist"
"kde_start_JBs.sh" "~/.config/kde_start_JBs.sh"
"lilo.conf_JBc" "/etc/lilo.conf"
"mirrors_slackpkg_15.0_JBc" "/etc/slackpkg/mirrors"
"rc.local_JBs.sh" "/etc/rc.d/rc.local"
"slackpkgplus.conf_15.0_JBc" "/etc/slackpkg/slackpkgplus.conf")

i=0
count_files=${#files_check[*]}
while [ "$i" -lt "$count_files" ]; do
    check_file "${files_check[i]}" "${files_check[$i+1]}"
    i=$((i + 2))
done

## Instal slackpkgplus
https://slakfinder.org/slackpkg+.html

## Instal multilib - need slackpkgplus
    ## Reinstall multilib or check if new packages was added
slackpkg install multilib

## Change SlackBuilds script to use only local folder
    # Good to folder mounted in RAM
#TMP=${TMP:-/tmp/SBo}
TMP=${TMP:-$PWD/SBo}

PKG=$TMP/package-$PRGNAM
#OUTPUT=${OUTPUT:-/tmp}
OUTPUT=${OUTPUT:-/$PWD}

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

## Laptop battery charging threshold limit
    ## Folder of configuration and information
        #cd /sys/class/power_supply/BATTERY_NAME/
        cd /sys/class/power_supply/BAT0/

        cat capacity
        cat status

        cat charge_control_start_threshold
        cat charge_control_end_threshold

    ## KDE configuration
        System Settings > Power Management > Advanced Power Settings
            Stop charging at: 95%
            Start charging only once below: 50%

## Make initrd - kernel generic
    # https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel
    ## Show the command - mkinitrd - list of modules
        /usr/share/mkinitrd/mkinitrd_command_generator.sh

    ## Make initrd
        /usr/share/mkinitrd/mkinitrd_command_generator.sh -r | /bin/bash

    ## Slackware 15.0 and current
        geninitrd

        ## Or
            pkgtool
                > Setup - Choose Slackware installation scripts to run again
                    > 01.mkinitrd - Generate /boot/initrd.gz for the generic Kernel

        ## To other kernel version installed
            /usr/share/mkinitrd/mkinitrd_command_generator.sh -k 5.15.117

        ## Adding other kernel modules
            /usr/share/mkinitrd/mkinitrd_command_generator.sh -m "ath10k_pci:ath10k_core:ath:mac80211:cfg80211"

    ## Add lilo configuration to end of configuration file
        #/usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-5.15.117 >> /etc/lilo.conf

        /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-* >> /etc/lilo.conf

        cat /etc/lilo.conf

    ## Update lilo
        lilo

    ## Tip: Edit lilo.conf "vmlinuz-generic-..." to "vmlinuz-generic"

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

    ## Check which driver is in use
        xrandr

        ## If outputs names have one - is modesetting
            eDP-1, HDMI-1 > modesetting

        ## If outputs names don't have one - is intel
            eDP1, HDMI1 > intel


    ## If use Nvidia driver - Change
        # https://github.com/ryuuzaki42/14_Nvidia_Driver_Slackware
        nano /etc/X11/xorg.conf.d/21-LAR-nvidia-screens.conf

            Driver "modesetting"
                ## To
            Driver "intel"
            Option "Backlight" "intel_backlight"

    ## If not use Nvidia driver
        ## Added the file 20-intel.conf
            nano /etc/X11/xorg.conf.d/20-intel.conf

Section "Device"
    Identifier "Intel Graphics"
    Driver     "intel"
    Option     "Backlight" "intel_backlight"
EndSection

        ## To use modesetting - xbacklight not works
Section "Device"
    Identifier "Intel Graphics"
    Driver     "modesetting"
EndSection

## Dolphin disable executable shell script, perl, ruby, pyton etc
kdesu kwrite /usr/share/mime/packages/freedesktop.org.xml

    ## Look for the lines and comment # with " " and ' '
        <sub-class-of type="application/x-executable"/>
        <!-- <sub-class-of type="application/x-executable"/> -->

        <sub-class-of type='application/x-executable'/>
        <!-- <sub-class-of type='application/x-executable'/> -->

    ## Update Dolphin configuration
rm /usr/share/mime/packages/kde.xml
update-mime-database /usr/share/mime

## KDE Set position to notifications
    System Settings > Notifications
        > Popup > Choose Custom Position...
            > lower right corner

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

    ## Add configuration in the fstab
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
    ## See info
        man fstrim

            # Running fstrim frequently, or even using mount -o discard, might negatively affect the lifetime of poor-quality SSD devices.
            # For most desktop and server systems a sufficient trimming frequency is once a week.

    ## Change the "SSD_MOUNT" in the scrpit for your partition mount folder
        # For me, weekly is enough
        cp fstrim_JBs.sh /etc/cron.weekly/

        ## To test:
            /etc/cron.weekly/fstrim_JBs.sh

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
        # All packages in that list will be shown but unchecked by default
        nano /etc/slackpkg/greylist

gcc
glibc

## slackpkg - Mirror local

    ## Clone and run script
        https://github.com/ryuuzaki42/12_clone_Slackware_repo_rsync

    ## Edit config file
        nano /etc/slackpkg/mirrors

    ## Local mirror stable
        file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-15.0/

    ## Local mirror current
        # file://media/sda2/prog/git_clone/2_clone_Slackware_repo/slackware64-current/

## slackpkg+ mirrors (old - to update list see the file slackpkgplus.conf_*)
    nano /etc/slackpkg/slackpkgplus.conf

    ## 15.0
        MIRRORPLUS['multilib']=http://bear.alienbase.nl/mirrors/people/alien/multilib/15.0/
        MIRRORPLUS['alienbob']=http://bear.alienbase.nl/mirrors/people/alien/sbrepos/15.0/x86_64/
        MIRRORPLUS['restricted']=http://bear.alienbase.nl/mirrors/people/alien/restricted_sbrepos/15.0/x86_64/

    ## Current
        MIRRORPLUS['multilib']=http://bear.alienbase.nl/mirrors/people/alien/multilib/current/
        MIRRORPLUS['alienbob']=http://bear.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/
        MIRRORPLUS['restricted']=http://bear.alienbase.nl/mirrors/people/alien/restricted_sbrepos/current/x86_64/

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
        git clone https://github.com/ryuuzaki42/02_Scripts_Linux/blob/master/boot_rcLocal_JBs.sh

        ## Set to run on the boot
            cp 02_Scripts_Linux/others/boot_rcLocal_JBs.sh /usr/bin/
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

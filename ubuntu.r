
    ## Ubuntu ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 13/11/2025
#

## git
    apt install git
## Ubuntu set the desktop to $HOME/Desktop
    ## Edit and added XDG_DESKTOP_DIR="$HOME/Desktop"
        nano ~/.config/user-dirs.dirs
## Ubuntu set a short password
    # Change <user> to the username
    sudo passwd <user>

------------------------------------------ Old Ubuntu ------------------------------------------

## Add user with home in another partition
    adduser j --home /media/sda2/home/j/

## kwrite
    apt install kwrite

## nvida driver
    apt install nvidia-driver-470

    ## change card
        prime-select intel
        prime-select nvidia

        ## Then you will have Nvidia X Server Settings in Dash.
        ## And there you can find PRIME profiles.

    ## test
        apt install mesa-utils

        glxinfo | grep "OpenGL render"

    ## KDE show FPS
        KDE > Settings > Desktop Efects > Show FPS

## steam
    ## download deb pkg
        wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb

    ## install
        sudo dpkg -i steam.deb

    ## run
        $ steam

        ## will open a terminal - root password to install curl, xterm, zenity
        ## Get some errors
            apt --fix-broken install

## Edit the grub
    nano /etc/default/grub
        1 - GRUB_TIMEOUT=10 to 3
        2 - Comment the line: GRUB_CMDLINE_LINUX_DEFAULT=”quiet splash”
        3 - Change GRUB_CMDLINE_LINUX="" to GRUB_CMDLINE_LINUX=”text”
        4 - Uncomment this line #GRUB_TERMINAL=console
        5 - update-grub

    ## Change Ubuntu to Kubuntu
        sed -i 's/Ubuntu/Kubuntu/g' /boot/grub/grub.cfg

## Remove games
    ## Search
        apt search <package_name>

        apt search kmines

    ## Remove
        apt remove kmines
        apt remove ksudoku
        apt remove kmahjongg

    ## Remove not needed
        apt autoremove

## disable services
    # https://linuxhint.com/disable_unnecessary_services_debian_linux/

    ## list services enable
        service --status-all

        service --status-all | grep +

        ## See all
            ls /etc/init.d

        ## disable a service
            systemctl disable <service>

        ## Also has status, stop, reload, restart
            systemctl status cups cups-browsed

    ## Stop and disable cups and cups-browsed
        systemctl stop cups cups-browsed
        systemctl disable cups cups-browsed

    ## Stop and disable apport and whoopsie (bugs report)
        systemctl stop apport whoopsie
        systemctl disable apport whoopsie

    ## Stop and disable unattended-upgrades and anacron
        systemctl stop unattended-upgrades anacron
        systemctl disable unattended-upgrades anacron

## veracrypt install deb
    https://www.veracrypt.fr/en/Downloads.html

    dpkg -i veracrypt-1.24-Update7-Ubuntu-21.04-amd64.deb

    apt --fix-broken install

## remove not needed packages
    apt autoremove

## dolphin root
    pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY KDE_SESSION_VERSION=5 KDE_FULL_SESSION=true dolphin

## mkvtoolnix
    apt install mkvtoolnix mkvtoolnix-gui

## smplayer
    https://www.smplayer.info/en/downloads

    dpkg -i smplayer_21.1.0-1+2.4_amd64.deb

## opera
    https://get.opera.com/pub/opera/desktop/
        > version /linux/ > .deb

    dpkg -i opera-stable_77.0.4054.90_amd64.deb

## obs-studio
    apt install obs-studio

    ## NVENC error
        Change in Scence > Settings > Output > Encoder
        Hardware (NVENC) to Software (x264)

## qbittorrent
    apt install qbittorrent

## qpdfview
    apt install qpdfview

## kolourpaint
    apt install kolourpaint

## java
    apt install openjdk-8-jre

## smartsynchronize
    # Version 4.2.1
    https://www.syntevo.com/smartsynchronize/download/

## MasterPDFEditor
    # Version 5.6.80
    MasterPDFEditor-5.6.80-x86_64-1_SBo.txz

## gimp
    apt install gimp

## geeqie
    apt install geeqie

## audacity
    apt install audacity

## kdiff3
    apt install kdiff3

## unrar
    apt install unrar

## diffpdf
    apt install diffpdf

## git-lfs
    apt install git-lfs

------------------------------------------ OldLinuxMint_KDE ------------------------------------------

# ## Driver Intel
    # echo "deb https://download.01.org/gfx/ubuntu/13.10/main saucy main #Intel Graphics drivers" | tee /etc/apt/sources.list.d/intellinuxgraphics.list
    # apt-get install intel-linux-graphics-installer

## SUMO + OMNeT + Veins
    apt-get install build-essential gcc g++ bison flex perl tcl-dev tk-dev blt libxml2-dev zlib1g-dev default-jre doxygen graphviz libwebkitgtk-1.0-0 openmpi-bin libopenmpi-dev libpcap-dev autoconf automake libtool libproj0 libgdal1-dev libfox-1.6-dev libgdal-dev libxerces-c-dev

    ## Install SUMO from zip file
        ./configure
        make
        make install

    ## Look in : "apt-get install sumo sumo-doc sumo-tools" for the extra packet
        In my case is:
        apt-get install binfmt-support fastjar jarwrapper libgl2ps0

    ## Install OMNet++
        apt-get install build-essential gcc g++ bison flex perl tcl-dev tk-dev libxml2-dev zlib1g-dev default-jre doxygen graphviz libwebkitgtk-1.0-0 openmpi-bin libopenmpi-dev libpcap-dev

    ## Install OMNet by the zip file
        TCL_LIBRARY=/usr/lib/tcl8.6
        apt-get install swig
        . setenv
        ./configure
        make
        make install-menu-item

    ## Add in .bashrc
        #
        export TCL_LIBRARY=/usr/lib64/tcl8.6
        export PATH=$PATH:/media/sda4/prog/omnetpp-4.6/bin
        export PATH=$PATH:/media/sda4/prog/veins-3.0/
        export SUMO_HOME=/media/sda4/prog/sumo-0.21.0
        #

## /etc/fstab
    /dev/sda4 /media/sda4 ext4 defaults 0 2

## Dropbox (zip file)
## Jdownload (.sh file)

## Install others programs
    apt-get install p7zip comix rar convmv r-base pv pdftk git skype kwrite kolourpaint4 kamerka

## Install master-pdf-editor, mendeleydesktop, RedshiftGUI, smartgit, telegram, texstudio, tomighty (deb file)

## remove flash and java plugin
    apt-get remove icedtea-7-plugin adobe-flashplugin

## Install Virtualbox (.sh file)

## Added klipper to Start with the system
    # start klipper
    klipper
    ## Right click Klipper -> Quit and select start.

## Install artha
    apt-get install artha

## Install qpdfview
    add-apt-repository ppa:b-eltzner/qpdfview
    apt-get update
    apt-get install qpdfview

## Install pt-BR language
    apt-get install myspell-pt-br
    ## Install the extension cogroo
    ## Change the configuration of memory and language

## Install Windows fonts
    apt-get install msttcorefonts
    ## or
    apt-get install ttf-mscorefonts-installer

## Install kdm (*and select kdm*)
    apt-get install kdm
    ## if not work
        dpkg-reconfigure kdm

## Remove Mono and Orca (*Windows applications a limited opportunity to run in Linux*)
    apt-get remove mono-runtime-common gnome-orca

## Disable hibernation (suspend-to-disk)
    mv -v /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla /

## To create a .deb packet (look in the telegram packet)
    $folder_program-version-arch$ -$ bin $
    Add *prog*/DEBIAN/control
    dpkg-deb --build program-version-arch
    dpkg -i program-version-arch

## Remove Amarok and dragon
    apt-get remove amarok dragonplayer

## Remove older vlc and vlc-nox and install new version
    apt-get remove vlc vlc-nox
    ## after
        add-apt-repository ppa:mc3man/trusty-media
        apt-get update
        apt-get install vlc
            ## vlc configuration and plugin
     ## Install vlc plugins
     apt-add-repository ppa:strukturag/libde265
     apt-get update
     apt-get install vlc-plugin-libde265
     apt-get install vlc-plugin*

## Remove older smplayer and install new version
    apt-get remove smplayer
    ## after
        add-apt-repository ppa:rvm/smplayer
        apt-get update
        apt-get install smplayer smplayer-themes smplayer-skins
        ## remove enqueue
            rm /usr/share/applications/smplayer_enqueue.desktop
            ## smplayer configs

## Disable service
    # For Linux Mint 17 based on Ubuntu you have to use this because it uses upstart:
    echo manual | tee /etc/init/<service_name>.override
    # For Linux Mint Debian Edition, it uses System V init, so you can issue, it will remove completely the init scripts for the service:
    update-rc.d -f <service_name> remove
    # So if you are disabling it for a while and you want it in the future, better use:
    update-rc.d <service_name> disable

## Install texlive (latex)
    ## Remove same older
        ## 2 times
            apt-get autoremove --purge tex-common texlive-base texlive-binaries texlive-common texlive-doc-base texlive-latex-base texlive-latex-base-doc texlive-full texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended
        apt-get autoclean
        apt-get autoremove

    ## Install texlive from Slackware latex folder

## Install texstudio (deb file)
    Use "xUbuntu 14.04 amd64 2.10.8, QT 4" on texstudio.sourceforge.net

## Remove ark and install a version with works password
    apt-get remove ark
    ## Add new source to install libarchive12
        echo "deb http://archive.ubuntu.com/ubuntu precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
        apt-get update
        apt-get install libarchive12
    ## Install ark from deb file (older ark from Debian Wheezy)
    dpkg -i ark_4.8.4-2_amd64.deb
    ## Remove ark from update manager

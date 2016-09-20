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
    ## Change the configs of memory and language

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
            ## vlc configs and plugin
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

## Edite the grup
    nano /etc/default/grub
        1 - GRUB_TIMEOUT=10 to 2
        2 - Comment the line: GRUB_CMDLINE_LINUX_DEFAULT=”quiet splash”
        3 - Change GRUB_CMDLINE_LINUX="" to GRUB_CMDLINE_LINUX=”text”
        4 - Uncomment this line #GRUB_TERMINAL=console
        5 - update-grub

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

## Instal texstudio (deb file)
    Use "xUbuntu 14.04 amd64 2.10.8, QT 4" on texstudio.sourceforge.net

## Remove ark and install a versin with works password
    apt-get remove ark
    ## Add new source to install libarchive12
        echo "deb http://archive.ubuntu.com/ubuntu precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
        apt-get update
        apt-get install libarchive12
    ## Instal ark from deb file (older ark from Debian Wheezy)
    dpkg -i ark_4.8.4-2_amd64.deb
    ## Remove ark from update manager

## Somes good infos
    https://sites.google.com/site/easylinuxtipsproject/mint-mate-first

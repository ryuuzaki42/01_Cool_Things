## XFCE disable session restore
xfce4-settings-editor, find and uncheck xfce4-session -> general -> SaveOnExit

## Keyboard
setxkbmap -model abnt2 -layout br

## Brightness 0 (rc.local) 
echo 0 > /sys/class/backlight/acpi_video0/brightness

## Install whiskey menu and add in the panel the icon-menu from whiskey-menu

## Change the keybord for portuguese-Brazil (select the frist - br)

## Change terminal size (Preferences > Appearance : Opening New Window : Default Geometry columns/ rows) to 100 x 30

## Added display_LVDS1_default_resolution.sh to start in the startup/boot

## To connect in Wi-Fi network with security PEAP in network-manager-applet-0.9.8.4, you will need to try connect in *network-will-conect* and after change (/etc/NetworkManager/system-connections/) the configuration of this connection to not use system-ca-certs
    nano /etc/NetworkManager/system-connections/ICMC-802-1X
        system-ca-certs=true => system-ca-certs=false

## Install KDE apps?
    ## kwrite
    slackpkg install kate kdelibs kactivities oxygen-gtk2 oxygen-gtk3 oxygen-icons

    ## ktorrent
    slackpkg install ktorrent libktorrent

    ## ark
    slackpkg install ark

    ## dolphin
    slackpkg install kde-baseapps nepomuk-core nepomuk-widgets

    ## ksnapshot
    slackpkg install ksnapshot libkipi

#
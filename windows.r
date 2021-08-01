## Windows do ##

## Windows don't recognize partition (NTFS) connected
    # open a command prompt (cmd) as administrator:
    1) diskpart
    2) list volume

    # You saw that all volumes
    3) select volume x (where x is the number of the offline volume)
    4) online volume

    # So you this volumes again online
    5) assign letter=R
    #Now you set a letter for mount, change R for the one letter available

## Disable windows update
    ## Or maybe not in Windows 10

## Disable hibernate
    powercfg.exe /hibernate off

    # Back to default - enable hibernate
        powercfg.exe /hibernate on

## disable visual effects
    Windows Key + x

## Disable backup

## Install Microsoft office, CCleaner, VLC, Smplayer, Steam, Firefox

## Get the motherboard from CMD
    wmic baseboard get product,manufacturer

## Enable F8 (boot legacy with good options) no Windows 10
    bcdedit /set bootmenupolicy legacy

    # Back to default - Disable F8
        bcdedit /set bootmenupolicy standard

## Windows HDMI wrong size image
    # Fix Desktop Overscaling if use a TV - Monitor
    Open Intel Video Manager
        > Go to size/scaling and change

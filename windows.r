## Windows do ##

## Windows don't recognize partition (NTFS) connected
    ## cmd as administrator
        diskpart

    ## With volume
        list volume

        # X is the number of the offline volume
        select volume X

        online volume

        # Assign a letter to make online
        # change R for the one letter available
        assign letter=R

    ## With disk
        list disk

        # X is the desired disk number
        select disk X

        list partition

        # X is the desired partition number
        select partition X

        active

    ## Minitool Partition Wizard
        > Set Active

        > Change Letter

        > Check Partition Type ID
            > 0x07 NTFS

        > Explore

## Disable Windows update with winaero-tweaker
    https://winaero.com/winaero-tweaker/#download

## Disable hibernate
    powercfg.exe /hibernate off

    ## Back to default - Enable hibernate
        powercfg.exe /hibernate on

## Reduce size of pagefile.sys - default size o RAM
    > This Computer > properties > Advanced system settings > Advanced
        Performance - Settings... > Advanced > Change
            x - Automatically manage
            > Custom size
                Initial: 1024
                Maximum: 2048

## disable visual effects
    Windows Key + x

## Disable backup

## Create one System Protection - Restore point

## Install Microsoft office, SumatraPDF, VLC, Smplayer, Firefox

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

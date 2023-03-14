
    ## Windows do ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 14/03/2023
#

## Check Windows license and activation status
    slmgr /xpr

## Turn off Internet Explorer support to Windows 10
    Control Panel\All Control Panel Items\Programs and Features
        > Turn Windows features on or off
            > Uncheck "Internet Explorer 11"

## Update windows apps -> Windows store
    Install "Intel® Graphics Command Center"

## Deleting "Activate Windows" option from Right Click Menu
    regedit >
        Computer\HKEY_CLASSES_ROOT\DesktopBackground\Shell\Activate Windows - Office
    Delete "Activate Windows" folder

## Disable Fast Startup on Windows 10
    Control Panel\All Control Panel Items\Power Options\System Settings
        > Change Settings That Are Currently Unavailable
            > Uncheck "Turn On Fast Startup"

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
    File Explorer > This PC > Properties > Advanced system settings > Advanced
        Performance > Settings... > Advanced > Change
            x - Automatically manage
            > Custom size
                Initial: 1024
                Maximum: 2048

## Disable visual effects
    File Explorer > This PC > Properties > Advanced system settings > Advanced
        Performance > Settings... > Visual Effects
            > Leave only checked "Show thumbnails instead of icons" and "Smooth edges of screen fonts"

## Create one System Protection - Restore point
    File Explorer > This PC > Properties > Advanced system settings > System Protection
        > Create... > Name "a1" > Create

## Install Microsoft office, SumatraPDF, VLC, Smplayer, Firefox

## Get the motherboard from CMD
    wmic baseboard get product,manufacturer

## Enable F8 (boot legacy with good options) no Windows 10
    bcdedit /set {default} bootmenupolicy legacy

    # Back to default - Disable F8
        bcdedit /set {default} bootmenupolicy standard

## Windows HDMI wrong size image
    # Fix Desktop Overscaling if use a TV - Monitor
    Open Intel Video Manager
        > Go to size/scaling and change

    ## Script.r - Greats commands for day life ##

## Windows setup could not configure to run on this computer hardware - error during Windows installation
    # Windows setup could not install on this computer hardware
    Manually run msoobe.exe program to allow the install to complete

    At the error screen, press Shift + F10 to open a command prompt
    cd c:\windows\system32\oobe and press Enter
    msoobe and press Enter


## Proper way to delete the Windows.old folder
    1 Windows search field, type Cleanup, then click "Disk Cleanup"
    2 Select the disk, common "(C:)"
    3 Select "Clean System Files"
    4 Wait a bit while Windows scans for files, then scroll down the list until you see "Previous Windows installation(s)"
    5 Check the box next to the entry. Click OK to start the cleanup

## How to Switch Off the Thumbs.db Image Cache File in Windows
    1 Ensure you’re logged in using an administrator account
    2 Hit Win+R, type gpedit.msc in the Run window and click OK. The Local Group Policy Editor will be launched
    3 Navigate through the tree to User Configuration > Administrative Templates > Windows Components >
        then either Windows Explorer (Windows Vista/7) or File Explorer (Windows 8).
    4 In the right-hand pane, double-click "Turn off the caching of thumbnails in hidden thumbs.db files"
    5 Select Enabled (don’t make my mistake of choosing "Disabled"
        — you’re enabling the switching off of Thumbs.db. Not particularly intuitive, Microsoft!)

## Trocar de unidade cmd
    X: (onde X: é a unidade onde seu pendrive está conectado.)

    ## Windows check files installation
        > cmd as administrator

        sfc /scannow

        DISM /Online /Cleanup-Image /RestoreHealth

## CMD
    del # apaga arquivo
    dir # mostra arquivos
    dir /A:H #mostra arquivos ocultos
    del /A:H x # apaga arquivo x oculto

## Remover vírus o Recycler bin
    attrib -a -h -r -s /s /d *.* # dentro da unidade

    -R Limpa o Atributo de arquivo somente leitura
    -A Limpa o Atributo de arquivo morto
    -S Limpa o Atributo de arquivo de sistema
    -H Limpa o Atributo de arquivo oculto
    /s Processa os arquivos correspondentes na pasta atual
    /d Inclui pastas no processamento

## Windows error 0xc00000e - Fix boot/mbr/BCD after clone
    > Boot USB ISO
        Select language > next
        Repair your computer > Advanced options > Command Prompt

    ## bootrec BCD (Boot Configuration Data) run all options
        bootrec /FixMbr
        bootrec /FixBoot
        bootrec /ScanOs
        bootrec /RebuildBcd

## Windows - Partition not recognized as NTFS after clone
    ## MiniTool Partition Wizard
        Select the partition > Change Partition Type ID > Set 0x07 NTFS

## Windows detects HDD as SSD - Re-enable defragmentation
    ## cmd as admin
        winsat formal

## Windows God Mode
    > New folder, set name as:
        GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}

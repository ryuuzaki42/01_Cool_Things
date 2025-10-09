
    ## Windows ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 09/10/2025
#

## Check Windows license and activation status
    # https://learn.microsoft.com/en-us/windows-server/get-started/activation-slmgr-vbs-options
    # slmgr or slmgr.vbs

    ## Display license information - /dli
        slmgr /dli

        ## Display detailed license information - /dlv
            slmgr /dlv

    ## Display the activation expiration date for the product
        slmgr /xpr

## Turn off Internet Explorer support to Windows 10
    %windir%\system32\control.exe

    Control Panel\All Control Panel Items\Programs and Features
        > Turn Windows features on or off
            > Uncheck "Internet Explorer 11"

    ## Disable Fast Startup on Windows 10
        Control Panel\All Control Panel Items\Power Options\System Settings
            > Change Settings That Are Currently Unavailable
                > Uncheck "Turn On Fast Startup"

## Disable Windows Update and others with winaero-tweaker
    # https://winaero.com/winaero-tweaker/#download
    > Use a old config "Winaero Tweaker_*.ini"

    > Disable updates
        Windows Update
        Edge Updates
        Store Apps Auto-update

## Disable hibernate - powercfg or powercfg.exe
    cmd > Run as administrador
    powercfg /hibernate off

    ## Back to default - Enable hibernate
        powercfg /hibernate on

    ## Check if hibernate status - If is on, will show in "sleep states available, below Standby (S3)"
        powercfg /a

## Changes in Advanced system settings
    File Explorer > This PC > Properties > Advanced system settings

    %windir%\system32\SystemPropertiesAdvanced.exe

        ## Advanced
            %windir%\system32\SystemPropertiesPerformance.exe

            ## Disable some visual effects
                Performance > Settings... > Visual Effects
                    > Adjust for best performanace
                        > Enable

                        > Show thumbnails instead of icons
                        > Smooth edges of screen fonts

            ## Reduce size of pagefile.sys - default size o RAM
                Performance > Settings... > Advanced
                    Virtual Memory > Change...
                        If RAM > 4 GiB
                            x - Automatically manage
                            > Custom size
                                Initial: 1024
                                Maximum: 2048
                        D: None

        ## Remote
            %windir%\system32\SystemPropertiesRemote.exe

            ## Disable Remote Assistance
                Remote Assistance
                    Disable "Allow Remote Assistance..."

        ## System Protection
            %windir%\system32\SystemPropertiesProtection.exe

            ## Create one System Protection - Restore point
                ## Enable in C:
                    Configure > Max Usage > 5%

                ## Create one manual
                    > Create... > Name "a1" > Create

                ## Off in the others partitions
                    D: > Configure > Disable system protection

                ## Check if was created correctly
                    System Restore... > Next

## Update Windows apps > Windows store
    If Intel
        Install Intel® Graphics Command Center
            https://apps.microsoft.com/detail/9PLFNLNT3G5G

    If Thinkpad
        Install Lenovo Vantage
            https://apps.microsoft.com/detail/9WZDNCRFJ4MV

    If Nvidia card
        Instal Nvidia driver
            https://apps.microsoft.com/detail/9NF8H0H7WMLT

## Error checking
    C: (and others partitions)
        Properties > Tools > Error checking
            > Check

    Optimize or/and defragment driver
        # SSD (optimize) - HD (defragment driver)
        C: (and others partitions)
            Properties > Tools >Optimize and defragment driver
                > Optimize

## Disk cleanup
    C: (and others partitions)
        Properties > General > Disk Cleanup
            > Clean up system files

## Install
    Microsoft office (Word, Excel, PowerPoint), SumatraPDF, VLC, Smplayer, Firefox, Revo Uninstaller,
    CristalDiskInfo, Master PDF Editor, Notepad++, Telegram, WinRAR, HWmonitor
    UCheck, AnyDesk, Winaero Tweaker,

## Windows don't recognize partition (NTFS) connected
    cmd > Run as administrador

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

        # X is the desired partition number
            select partition X

            active

    ## Minitool Partition Wizard
        > Set Active

        > Change Letter

        > Check Partition Type ID
            > 0x07 NTFS

        > Explore

## Deleting "Activate Windows" option from Right Click Menu
    regedit >
        Computer\HKEY_CLASSES_ROOT\DesktopBackground\Shell\Activate Windows - Office
            Delete "Activate Windows" folder

## Get the motherboard from cmd
    wmic baseboard get product,manufacturer

## Run program as administrator
    runas /savecred /user:Administrator "C:\Windows\system32\cmd.exe"

    runas /savecred /user:administrador "c:\wamp64\wampmanager.exe"

    runas /savecred /user:administrador "cmd"

## System info
    systeminfo

## Windows version
    winver

## get MAC address
    getmac

## IP info
    ipconfig

    ipconfig /all

## DNS / name server lookup
    nslookup google.com

    nslookup google.com 1.1.1.1

## route show
    route print

## traceroute Windows version
    tracert google.com

## Enable F8 (boot legacy with good options) no Windows 10
    bcdedit /set {default} bootmenupolicy legacy

    ## Back to default - Disable F8
        bcdedit /set {default} bootmenupolicy standard

## Windows HDMI wrong size image
    # Fix Desktop Overscaling if use a TV - Monitor
    Open Intel Video Manager
        > Go to size/scaling and change

## Windows setup could not configure to run on this computer hardware - error during Windows installation
    # Windows setup could not install on this computer hardware
    Manually run msoobe.exe program to allow the install to complete

    At the error screen, press Shift + F10 to open a command prompt-tweaker
    cd c:\windows\system32\oobe and press Enter
    msoobe and press Enter

## Windows 10 - Windows 11 - bypass online account - "enable" local account
    1. Disconnect your net connection
    2. Shift + F10
    3. oobe\bypassnro
    4. Will reboot and now can create local account

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

## Windows check files installation
    > cmd as administrator

    ## Switch unit partition
        X: (where X: is the drive your USB stick is connected to)

        sfc /scannow

        DISM /Online /Cleanup-Image /RestoreHealth

## Restore the content of CHK files - CHK BAK
    FOUND/FILE.CHK

    > Chk-Back
    https://download.cnet.com/chk-back/3000-2094_4-75695425.html

## Remove virus Recycle bin
    ## Inside the partition
        attrib -a -h -r -s /s /d *.*

     -r Clears read-only file attribute
     -a Clears the dead file attribute
     -s Clears system file attribute
     -h Clear hidden file attribute
     /s Processes matching files in the current folder and all subfolders
     /d Processes folders as well

## Uninstall GRUB and use Windows bootloader
    # or
## Windows error 0xc00000e - Fix boot/mbr/BCD after clone
    > Boot USB ISO
        Select language > next
        Repair your computer > Advanced options > Command Prompt

    > Or restart Windows while holding the Shift key

    ## bootrec BCD (Boot Configuration Data) run all options
        bootrec /FixMbr
        bootrec /FixBoot
        bootrec /ScanOs
        bootrec /RebuildBcd

## Windows Update error 0x80070001
    Clean disck C: up to 8 GiB or more of free space and try update

## Windows - Partition not recognized as NTFS after clone
    ## MiniTool Partition Wizard
        Select the partition > Change Partition Type ID > Set 0x07 NTFS

## Windows detects HDD as SSD - Re-enable defragmentation
    ## cmd as admin
        winsat formal

## Windows God Mode
    > New folder, set name as:
        GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}

## Check events - Reliability
    Start > Search for Reliability > Open "Reliability Monitor"

    ## Confiabilidade
        Iniciar > Pesquise por Confiabilidade > Abrir "Monitor de Confiabilidade"

## Install Windows 11 without TPM, Secure Boot etc
    ## Install until "Select OS version"
        Shift + F10 # cmd shortcut

        regedit

        [HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig]

            “BypassTPMCheck”        =dword :1
            “BypassSecureBootCheck” =dword :1

            “BypassRAMCheck”     = dword :1
            “BypassStorageCheck” = dword :1
            “BypassCPUCheck”     = dword :1

    ## Bypass Internet connection to continue
        Shift + F10

        oobe\bypassnro

## Windows 7 WiFi / Network icon not working
    > Task manager > Close the "Explorer.exe"

    > New task
        > cmd /c del %userprofile%\AppData\Local\IconCache.db /a

    > Mew task
        > Explorer.exe

## Delete old "name" / SSID Wi-Fi network
    ## Open regedit
        Win + R
        regedit

    ## Following registry key:
        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles

        Check under Profiles and find the key related to the Wi-Fi network profile that want to delete
        Right-click it and select Delete to delete a whole registry key.

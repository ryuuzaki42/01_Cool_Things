
    ## Windows do ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 03/06/2024
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
    https://winaero.com/winaero-tweaker/#download
        > Use a old config "Winaero Tweaker_*.ini"

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
    CristalDiskInfo, Master PDF Editor, Notepad++, PathMyPc, Telegram, WinRAR, HWmonitor

-------------------------------------------------------------------------------

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

## Enable F8 (boot legacy with good options) no Windows 10
    bcdedit /set {default} bootmenupolicy legacy

    # Back to default - Disable F8
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

## cmd commands
    https://learn.microsoft.com/pt-br/windows-server/administration/windows-commands/windows-commands

    ## delete
        ## Delete a file
            del file.txt

        ## Delete hidden x file
            del /A:H x

        ## Delete all files in a path - q quiet
            del /q "C:\Users\Aluno\Downloads\*"

        ## Delete all directory in a path - cmd command
            for /d %p in ("C:\Users\Aluno\Downloads\*.*") do rmdir "%p" /s /q

            ## In batch script - add % in variable %p. -"
                for /d %%p in ("C:\Users\Aluno\Downloads\*.*") do rmdir "%%p" /s /q

        ## Delete all empty folders - cmd command
            cd C:\Users\Aluno\Documents\
            for /f "delims=" %d in ('dir /s /b /ad ^| sort /r') do rd "%d"

            ## In batch script - add % in variable %d. -"
                cd C:\Users\Aluno\Documents\
                for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"

    ## Comment
        :: Comment

        ## or - Rem from Remarks
            Rem Comment

    ## Comment in line
        echo Hello World & :: Comment
        echo Hello World & Rem Comment

    ## Change directory
        C:

        cd C:\Users\Aluno\Documents\

        E:

    ## Pint message
        echo mesage

        ## Disable echo
            @echo off

        ## Example with if
            @echo off
            if not exist *.txt (
                echo This directory contains no text files.
            ) else (
                echo This directory contains the following text files:
                echo.
                dir /b *.txt
            )

    ## help
        help

            For more information on a specific command, type HELP command-name

            assoc       Displays or modifies file extension associations.
            attrib      Displays or changes file attributes.
            break       Sets or clears extended ctrl+c checking.
            bcdedit     Sets properties in boot database to control boot loading.
            cacls       Displays or modifies access control lists (acls) of files.
            call        Calls one batch program from another.
            cd          Displays the name of or changes the current directory.
            chcp        Displays or sets the active code page number.
            chdir       Displays the name of or changes the current directory.
            chkdsk      Checks a disk and displays a status report.
            chkntfs     Displays or modifies the checking of disk at boot time.
            cls         Clears the screen.
            cmd         Starts a new instance of the windows command interpreter.
            color       Sets the default console foreground and background colors.
            comp        Compares the contents of two files or sets of files.
            compact     Displays or alters the compression of files on ntfs partitions.
            convert     Converts fat volumes to ntfs.  you cannot convert the current drive.
            copy        Copies one or more files to another location.
            date        Displays or sets the date.
            del         Deletes one or more files.
            dir         Displays a list of files and subdirectories in a directory.
            diskcomp    Compares the contents of two floppy disks.
            diskcopy    Copies the contents of one floppy disk to another.
            diskpart    Displays or configures disk partition properties.
            doskey      Edits command lines, recalls windows commands, and creates macros.
            driverquery Displays current device driver status and properties.
            echo        Displays messages, or turns command echoing on or off.
            endlocal    Ends localization of environment changes in a batch file.
            erase       Deletes one or more files.
            exit        Quits the cmd.exe program (command interpreter).
            fc          Compares two files or sets of files, and displays the differences between them.
            find        Searches for a text string in a file or files.
            findstr     Searches for strings in files.
            for         Runs a specified command for each file in a set of files.
            format      Formats a disk for use with windows.
            fsutil      Displays or configures the file system properties.
            ftype       Displays or modifies file types used in file extension associations.
            goto        Directs the windows command interpreter to a labeled line in a batch program.
            gpresult    Displays group policy information for machine or user.
            graftabl    Enables windows to display an extended character set in graphics mode.
            help        Provides help information for windows commands.
            icacls      Display, modify, backup, or restore acls for files and directories.
            if          Performs conditional processing in batch programs.
            label       Creates, changes, or deletes the volume label of a disk.
            md          Creates a directory.
            mkdir       Creates a directory.
            mklink      Creates symbolic links and hard links
            mode        Configures a system device.
            more        Displays output one screen at a time.
            move        Moves one or more files from one directory to another directory.
            openfiles   Displays files opened by remote users for a file share.
            path        Displays or sets a search path for executable files.
            pause       Suspends processing of a batch file and displays a message.
            popd        Restores the previous value of the current directory saved by pushd.
            print       Prints a text file.
            prompt      Changes the windows command prompt.
            pushd       Saves the current directory then changes it.
            rd          Removes a directory.
            recover     Recovers readable information from a bad or defective disk.
            rem         Records comments (remarks) in batch files or config.sys.
            ren         Renames a file or files.
            rename      Renames a file or files.
            replace     Replaces files.
            rmdir       Removes a directory.
            robocopy    Advanced utility to copy files and directory trees
            set         Displays, sets, or removes windows environment variables.
            setlocal    Begins localization of environment changes in a batch file.
            sc          Displays or configures services (background processes).
            schtasks    Schedules commands and programs to run on a computer.
            shift       Shifts the position of replaceable parameters in batch files.
            shutdown    Allows proper local or remote shutdown of machine.
            sort        Sorts input.
            start       Starts a separate window to run a specified program or command.
            subst       Associates a path with a drive letter.
            systeminfo  Displays machine specific properties and configuration.
            tasklist    Displays all currently running tasks including services.
            taskkill    Kill or stop a running process or application.
            time        Displays or sets the system time.
            title       Sets the window title for a cmd.exe session.
            tree        Graphically displays the directory structure of a drive or path.
            type        Displays the contents of a text file.
            ver         Displays the windows version.
            verify      Tells windows whether to verify that your files are written correctly to a disk.
            vol         Displays a disk volume label and serial number.
            xcopy       Copies files and directory trees.
            wmic        Displays wmi information inside interactive command shell.

            For more information on tools see the command-line reference in the online help.

        help dir

        dir /?

    ## History
        doskey /history

        ## Or
            F7

    ## Open cmd in current folder - explorer -> win + E
        explorer > go to folder
            explorer URL/PATH > cmd

    ## Clip - copy result command
        help | clip

    ## > and >> - redirect output to a file
        help > f.txt
        help >> f.txt

    ## Show text file in terminal
        type f.txt

    ## show files
        dir

        ## Show hidden files
            dir /a:h
            dir /a:h /b /s

        ## Clean C: recycle.bin
            rd /s /q C:\$recycle.bin

            ## Or
                del /s /q C:\$Recycle.bin

            ## E:
                rd /s /q E:\$recycle.bin

    ## Rename
        move before.txt after.txt

    ## Create directory
        mkdir folder\

    ## delete
        del file.txt

        ## folder if empty
        ## rd and rmdir are synonyms
            rmdir folder\

            rd folder\

        ## folder if empty
            rmdir /s folder\

            rmdir /s /q folder\

            rd /s folder\

            rd /s /q folder\

    ## Show attributes
        attrib file.txt

        attrib folder\

        ## Add attribute hidden
            attrib +h file.txt

            attrib +h folder\

        ## Remove attribute hidden
            attrib -h file.txt

            attrib -h folder\

        ## attribute read-only
            attrib +r file.txt

            attrib -r file.txt

    ## function
        cd C:\Users\Aluno\
        call:delete_all C:\Users\Aluno\

       :delete_all
            echo. delete all files *.ods *.odt *.odp in %~1
            del /S *.ods *.odt *.odp
            del *.zip *.pdf
        goto:eof

    ## pause
        pause

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

## Remove virus Recycle bin
    ## Inside the partition
        attrib -a -h -r -s /s /d *.*

     -r Clears read-only file attribute
     -a Clears the dead file attribute
     -s Clears system file attribute
     -h Clear hidden file attribute
     /s Processes matching files in the current folder and all subfolders
     /d Processes folders as well

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

## Delete old "name"/SSID Wi-Fi network
    ## Open regedit
        Win + R
        regedit

    ## Following registry key:
        HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles

        Check under Profiles and find the key related to the Wi-Fi network profile that want to delete
        Right-click it and select Delete to delete a whole registry key.

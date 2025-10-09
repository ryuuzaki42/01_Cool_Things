    ## cmd commands ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 09/10/2025
#

## Windows Commands
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
        convert     Converts fat volumes to ntfs. you cannot convert the current drive.
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

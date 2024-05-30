
    ## AppImage ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 30/05/2023
#

https://github.com/AppImage/AppImageKit/blob/master/README.md

## Extract AppImage
    --appimage-extract

    ./Prog.AppImage --appimage-extract

## Mount AppImage
    --appimage-mount

    ./Prog.AppImage --appimage-mount

## File name is defined in:
    squashfs-root/Prog.desktop

    squashfs-root/WinRAR.desktop
        Name=winrar-6.24

## Create AppImage
    https://github.com/AppImage/AppImageKit/releases

    ## Last version
        ./appimagetool-x86_64.AppImage --version
            appimagetool, continuous build (commit 5735cc5), build <local dev build> built on 2023-03-08 22:52:04 UTC

    ## 32 bits
        ARCH=i686 ./appimagetool-x86_64.AppImage squashfs-root/

    ## 64 bits
        ARCH=x86_64 ./appimagetool-x86_64.AppImage squashfs-root/

        ARCH=x86_64 ./appimagetool/appimagetool-x86_64.AppImage squashfs-root/

## Extract .exe program
    1 Check if has one portable version

    2 Rename the .exe to .rar or .zip and try extrart with ark or PeaZip*.AppImage

    3 Install the program in the Windows and copy the install folder

## WinRAR
    ## Download the last version

    # ## Rename .exe to .rar
    #    mv winrar-x64-701.exe winrar-x64-701.rar

    # ## Extract WinRAR*.rar

    ## Extract WinRAR*.exe with an old version of WinRAR_AppImage

    ## Clone mirror
        git clone https://github.com/ryuuzaki42/WinRAR_AppImage

    ## Upgrade WinRAR install in WinRAR_AppImage/drive_c/WinRAR/

    ## Teste local version
        ./AppRun

            Help > Version

    ## Clean system.reg
        Values with user name, Intel, NVIDIA, CPU

        "ProfileImagePath"="C:\\users\\"

        "DriverDesc"=""
        "HardwareInformation.*"

        "ComputerName"=""

        "PROCESSOR_ARCHITECTURE"=""
        "PROCESSOR_IDENTIFIER"=""

        "DeviceDesc"=""

        "Domain"=""
        "Hostname"=""

    ## Clean user.reg - Delete entries

        "APPDATA"
        "CLIENTNAME"

        "HOMEPATH"

        "LOCALAPPDATA"
        "LOGONSERVER"

        "USERDOMAIN"
        "USERNAME"
        "USERPROFILE"

    ## Make commit of update / version

    ## Github actions auto generate the AppImage

        ## Move to trash
            .git/
            .github/
            .gitignore

        ## Add Key
            drive_c/WinRAR/rarreg.key

        ## Create AppImage
            ARCH=x86_64 ./appimagetool-x86_64.AppImage WinRAR_AppImage/

## Command line arguments
    --appimage-help
        Prints the help options

    --appimage-offset
        Prints the offset at which the embedded filesystem image starts, and then exits.
        This is useful in case you would like to loop-mount the filesystem image using the mount -o loop,offset=... command

    --appimage-extract [<pattern>]
        Extracts the contents from the embedded filesystem image, then exits.
        If pattern is passed, only extract matching files
        This is useful if you are using an AppImage on a system on which FUSE is not available

    --appimage-mount
        Mounts the embedded filesystem image and prints the mount point, then waits until it is killed with Ctrl-C.
        This is useful if you would like to inspect the contents of an AppImage without executing the contained payload application

    --appimage-version
        Prints the version of AppImageKit, then exits. This is useful if you would like to file issues

    --appimage-updateinformation
        Prints the update information embedded into the AppImage, then exits.
        This is useful for debugging binary delta updates

    --appimage-signature
        Prints the digital signature embedded into the AppImage, then exits.
        This is useful for debugging binary delta updates. If you would like to validate the embedded signature,
        you should use the validate command line tool that is part of AppImageKit

    --appimage-portable-home
        Create a portable home folder to use as $HOME

    --appimage-portable-config
        Create a portable config folder to use as $XDG_CONFIG_HOME

    --appimage-updateinfo
        Print update info embedded in AppImage

    ## Portable home:
        If you would like the application contained inside this AppImage to store its
        data alongside this AppImage rather than in your home directory, then you can
        place a directory named

        <PATH_to_App>/APP_FULL_Name.AppImage.home/
        /media/sda2/os/gnu_linux/slackware15.0/AppImage/appimagetool/appimagetool-x86_64.AppImage.home

        Or you can invoke this AppImage with the --appimage-portable-home option,
        which will create this directory for you. As long as the directory exists
        and is neither moved nor renamed, the application contained inside this
        AppImage to store its data in this directory rather than in your home directory

## Create AppImage with squashfs
    ## Make squashfs
        ## Normal mode -  AppImageTool
            mksquashfs "/path/to/Prog" "/path/to/Prog.squashfs" -root-owned -noappend

        ## No compression
            mksquashfs "/path/to/Prog" "/path/to/Prog.squashfs" -root-owned -noappend -comp gzip -Xcompression-level 1 -Xstrategy huffman_only -noI -noId -noD -noF -noX -no-recovery

        ## Max compression
            mksquashfs "/path/to/Prog" "/path/to/Prog.squashfs" -root-owned -noappend -comp xz

    ## Create AppImage - Combine runtime and squashfs
        ## Download runtime from continuous
            https://github.com/AppImage/AppImageKit/releases

            ## Or
            https://github.com/AppImage/type2-runtime

        cat "runtime-x86_64" "Prog.squashfs" > "Prog.AppImage"

## Append a new runtime
    ## Download runtime
        ## Link above

    ARCH=x86_64 ./appimagetool-x86_64.AppImage --runtime-file "/path/to/runtime/runtime-x86_64" -n squashfs-root/

    #rm -rf squashfs-root/

## Error version `GLIBC_2.34' not found
    ## 1. Recompile the program with "old" version of gcc, glib, qt5 and other needs

    ## 2. Use conty to pass the needed libs
        ## Download conty
            https://github.com/Kron4ek/Conty

        ## Run steam or a game
        ./conty_lite.sh steam

        ## Nvidia user will download driver
        ## Can disable the Nvidia with NVIDIA_HANDLER=0:
            NVIDIA_HANDLER=0 ./conty.sh

        ## Can run AppImage with need new glibc
        ## Extract Appimage and pass the path
            ./conty.sh /tmp/.mount_*/AppRun

            NVIDIA_HANDLER=0 ./conty.sh /tmp/.mount_*/AppRun

    ## 3. Create the AppImage using ArchImage
        Example: https://github.com/ryuuzaki42/AppImage_Full_ArchImage

        ## Package will be larger, but with more support
            https://github.com/ivan-hc/ArchImage

        ## Use Arch packages
            https://archlinux.org/packages/

        ## Generate prog-junest.sh
            ./archimage-cli -b prog
                > all blank

                ## Or
                    blank, blank, y, y
                    blank, blank, n, y # No dependencies

            ## Maybe save the prog-junest.sh in ~

        ## Create AppImage
            mkdir tmp/; cd tmp/
            mv ~/prog-junest.sh tmp/

            ./prog-junest.sh

##  Run AppImage locally
    https://github.com/ryuuzaki42/02_Scripts_Slackware/blob/main/run_AppImage_JBs.sh

    wget https://raw.githubusercontent.com/ryuuzaki42/02_Scripts_Slackware/main/run_AppImage_JBs.sh

    chmod +x run_AppImage_local_JBs.sh

    ## For help
        ./run_AppImage_local_JBs.sh -h

    ./run_AppImage_local_JBs.sh Prog*.AppImage -p

    ./run_AppImage_local_JBs.sh Prog*.AppImage -p --help

    ./run_AppImage_local_JBs.sh Prog*.AppImage -p Par1 Par2


    ## AppImage ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 27/04/2026
#

https://github.com/AppImage/appimagetool/releases/tag/continuous

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

    ## Go version use version tag
        https://github.com/probonopd/go-appimage/releases

        version="7.10"
        ARCH=x86_64 VERSION="${version}-1_JB" ./appimagetool-x86_64.AppImage WinRAR_AppImage/

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

## Update AppImage - Check for update
    https://docs.appimage.org/packaging-guide/optional/updates.html

    https://github.com/AppImageCommunity/AppImageUpdate/releases

    ## Download
        https://github.com/AppImageCommunity/AppImageUpdate/releases/download/continuous/appimageupdatetool-x86_64.AppImage
        appimageupdatetool-x86_64.AppImage

    ## Test
        ./appimageupdatetool-x86_64.AppImage prog.AppImage

    ## Information about update of some program - repository information
        ./prog.AppImage --appimage-updateinfo

        ./appimageupdatetool-x86_64.AppImage --appimage-updateinfo
            gh-releases-zsync|AppImage|AppImageUpdate|continuous|appimageupdatetool-*x86_64.AppImage.zsync

## WinRAR
    ## Download the last version

    # ## Rename .exe to .rar
    #    mv winrar-x64-701.exe winrar-x64-701.rar

    # ## Extract WinRAR*.rar
    ## Extract WinRAR*.exe with an old version of WinRAR_AppImage

    ## Clone mirror
        git clone https://github.com/ryuuzaki42/WinRAR_AppImage

    ## Upgrade WinRAR install in WinRAR_AppImage/drive_c/WinRAR/

    ## Test local version
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
        ## Normal mode - AppImageTool
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
        ## Extract AppImage and pass the path
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
    https://github.com/ryuuzaki42/02_Scripts_Linux/blob/main/run_AppImage_JBs.sh

    wget https://raw.githubusercontent.com/ryuuzaki42/02_Scripts_Linux/main/run_AppImage_JBs.sh

    chmod +x run_AppImage_local_JBs.sh

    ## For help
        ./run_AppImage_local_JBs.sh -h

    ./run_AppImage_local_JBs.sh Prog*.AppImage -p

    ./run_AppImage_local_JBs.sh Prog*.AppImage -p --help

    ./run_AppImage_local_JBs.sh Prog*.AppImage -p Par1 Par2

## Ubuntu Error while loading shared libraries: libQt5PrintSupport.so.5: cannot open shared object file: No such file or directory
    sudo apt install libqt5printsupport5

## Error loading libfuse.so.2 - AppImages require FUSE to run
    ## Ubuntu - Do not install fuse, will break the system!
    # https://askubuntu.com/questions/1409496/how-to-safely-install-fuse-on-ubuntu-22-04
    https://github.com/AppImage/AppImageKit/wiki/FUSE

    ## Debian (>= 13) and Ubuntu (>= 24.04):
        sudo add-apt-repository universe
        sudo apt install libfuse2t64

    ## Ubuntu (>= 22.04):
        sudo add-apt-repository universe
        sudo apt install libfuse2

    ## Or
    ## Extract and rebuilt the AppImage using a recent version of appimagetool
        ./app.AppImage --appimage-extract

        wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
        chmod + appimagetool-x86_64.AppImage

        https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage

        ./appimagetool-x86_64.AppImage squashfs-root/

## Plugin "xcb" not found - Need libxcb-cursor0
    ## Install libxcb-cursor0
        sudo apt install libxcb-cursor0

    ## Or added inside /usr/lib/ in AppImage
        # https://ubuntu.pkgs.org/24.04/ubuntu-universe-amd64/libxcb-cursor0_0.1.4-1build1_amd64.deb.html
        # http://archive.ubuntu.com/ubuntu/pool/universe/x/xcb-util-cursor/libxcb-cursor0_0.1.4-1build1_amd64.deb

        https://github.com/ryuuzaki42/Calibre_AppImage/blob/main/.github/workflows/build.yml
        # Add libxcb-cursor from Ubuntu
        cd calibre/lib/
        wget https://github.com/ryuuzaki42/Calibre_AppImage/releases/download/main-00000000/libxcb-cursor.so.0.0.0
        ln -s libxcb-cursor.so.0.0.0 libxcb-cursor.so.0
        pwd; ls -lah

## Using Wine in AppImage - Stable
    https://github.com/mmtrt/WINE_AppImage

    ## Remove 32 bits
        cd opt/wine-stable/lib/wine/
        rm -r i386-windows/

    ## Remove 64 bits
        cd opt/wine-stable/lib/wine/
        rm -r x86_64-unix/
        rm -r x86_64-windows/

    ## Disable core fonts download/instal
        ... WINEDLLOVERRIDES="mscoree=d;mshtml=d" ...

    ## Prefix in RAM - zero disk footprint
        folder_name_RAM="Deffy_AppImage_$(date +%d_%m_%Y)"
        mkdir -p /dev/shm/$folder_name_RAM/
        ... WINEPREFIX=/dev/shm/$folder_name_RAM ...
        rm -r /dev/shm/$folder_name_RAM/

    ## Full command
        WINEDLLOVERRIDES="mscoree=d;mshtml=d" WINEPREFIX=/dev/shm/$folder_name_RAM "$HERE"/AppRun_2 "$HERE"/Deffy.exe

## Check is using default mode or using portable mode
    # https://github.com/ryuuzaki42/Gromit-MPX_AppImage/blob/main/.github/workflows/build.yml

    HERE="$(dirname "$(readlink -f "${0}")")"
    echo "XDG_CONFIG_HOME: $XDG_CONFIG_HOME"
    if [ "$XDG_CONFIG_HOME" != "" ]; then # If use --appimage-portable-config
        config_path="$XDG_CONFIG_HOME/"
    else # Default mode, use ~/.config/
        config_path="$HOME/.config/"
    fi

    ## Check some configuration file exists, if not copy
        if [ ! -f "$config_path/gromit-mpx.cfg" ]; then # Check if configuration file exists
            echo "Configuration not found! - Coping default one"
            cp "$HERE"/etc/gromit-mpx/gromit-mpx.cfg "$config_path"
        fi
        echo "Gromit-MPX configuration file: $config_path/gromit-mpx.cfg"

## AppImage wiht JRE inside
    ## Using CrossMobile
        https://github.com/crossmob/CrossMobile

    ## Used in sacd_extract_AppImage
        https://github.com/ryuuzaki42/sacd_extract_AppImage/blob/main/.github/workflows/build.yml

    ## Download AppImage with JRE and extract
        wget -q https://github.com/ryuuzaki42/sacd_extract_AppImage/releases/download/main-0001/CrossMobile-3.4.0.x86_64.AppImage
        fileName=$(ls CrossMobile*.AppImage)
        chmod +x "$fileName"
        ./"$fileName" --appimage-extract
        rm -v "$fileName"

    ## Download and install/extract the new application
        wget -q https://github.com/ryuuzaki42/sacd_extract_AppImage/releases/download/main-0002/SACDExtractGUI.zipp
        unzip SACDExtractGUI.zip -d sacd_extract/

    ## Update AppRun and prog.desktop
        cp AppRun squashfs-root/

    ## Generate the new AppImage
        ARCH=x86_64 VERSION="${version}-${tag}_JB" ./appimagetool-x86_64.AppImage squashfs-root/

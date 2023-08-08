
    ## AppImage ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 08/08/2023
#

https://github.com/AppImage/AppImageKit/blob/master/README.md

## Extract AppImage - --appimage-extract
    ./Prog.AppImage --appimage-extract

## Mount AppImage - --appimage-mount
    ./Prog.AppImage --appimage-mount

## Create AppImage
    # https://github.com/AppImage/AppImageKit/releases/latest
    ## Download
        wget https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage
        chmod +x appimagetool-x86_64.AppImage

    ## Version
        ./appimagetool-x86_64.AppImage --version
            appimagetool, continuous build (commit 8bbf694), build <local dev build> built on 2020-12-31 11:48:33 UTC

    ## File name is defined in: - squashfs-root/Prog.desktop
        squashfs-root/WinRAR.desktop
            Name=winrar-6.23

    ## Make AppImage - ARCH=
        ARCH=i686 ./appimagetool-x86_64.AppImage squashfs-root/

        ARCH=x86_64 ./appimagetool-x86_64.AppImage squashfs-root/

        ARCH=x86_64 ./appimagetool/appimagetool-x86_64.AppImage squashfs-root/

## Try extract .exe program
    ## Check if has one portable version

    ## Rename the .exe to .rar or .zip and try extract with ark or PeaZip*.AppImage

    ## Install the program in the Windows and copy the install folder

## WinRAR AppImage
    ## Rename .exe to .rar
        mv winrar-x64-623.exe winrar-x64-623.rar

        ## Extract WinRAR*.rar

    ## Clone mirror
        git clone https://github.com/ryuuzaki42/WinRAR_AppImage

        ## Upgrade WinRAR install in WinRAR_AppImage/drive_c/WinRAR/

            ## Make commit of update version

        ## Move to trash
            .git/
            .github/
            .gitignore

            ## Key
                drive_c/WinRAR/rarreg.key

    ## Create AppImage
        ARCH=x86_64 ./appimagetool-x86_64.AppImage WinRAR_AppImage/

## Command line arguments
    --appimage-help
        Prints the help options

    --appimage-offset
        Prints the offset at which the embedded filesystem image starts, and then exits.
        This is useful in case you would like to loop-mount the filesystem image using the mount -o loop,offset=... command

    --appimage-extract
        Extracts the contents from the embedded filesystem image, then exits.
        [<pattern>] If pattern is passed, only extract matching files
        This is useful if you are using an AppImage on a system on which FUSE is not available

    --appimage-mount
        Mounts the embedded filesystem image and prints the mount point, then waits until it is killed with Ctrl-C.
        This is useful if you would like to inspect the contents of an AppImage without executing the contained payload application

    --appimage-version
        prints the version of AppImageKit, then exits. This is useful if you would like to file issues

    --appimage-updateinformation
        prints the update information embedded into the AppImage, then exits.
        This is useful for debugging binary delta updates

    --appimage-signature
        prints the digital signature embedded into the AppImage, then exits.
        This is useful for debugging binary delta updates. If you would like to validate the embedded signature,
        you should use the validate command line tool that is part of AppImageKit

    --appimage-portable-home
        Create a portable home folder to use as $HOME

  --appimage-portable-config]
        Create a portable config folder to use as $XDG_CONFIG_HOME

  --appimage-updateinfo
        Print update info embedded in AppImage

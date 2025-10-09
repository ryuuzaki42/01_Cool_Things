
    ## other_browsers ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 09/10/2025
#

    ## Vivaldi ##

## Vivaldi freeze after update - AppImage
    ## Remove Bookmarks and restart, after can restore the Bookmarks
    cd ~/.config/vivaldi/Default/

    mv Bookmarks Bookmarks2

    ## Start Vivaldi and close

    mv Bookmarks2 Bookmarks

-------------------------------------------------------------------------------

    ## LibreWolf ##

## Disable clear history
    Settings
        > General
            Open previous windows and tabs
                > Enable

        > Privacy & Security >
            Clear history when LibreWolf closes
                > Disable

            Enable DNS over HTTPS using
                > Default Protection

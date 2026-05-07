
    ## other_browsers ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 07/05/2026
#

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

## LibreWolf - wrong time zone
    # LibreWolf shows the wrong time zone because it forces privacy.resistFingerprinting (RFP) to true,
    # which spoofs the time to UTC to prevent tracking
    ## Disable Resist Fingerprinting - Not Recommended for Privacy
        about:config

        privacy.resistFingerprinting.
            true > false

## LibreWolf - add google as search engine in URL bar
    about:preferences#search
        Go to the bottom and add search engine

    ## Fill with
        google
            # exactly or any other, the name Google is blocked

        https://www.google.com/search?q=%s

    It will now appear so you can change it to the default search engine

-------------------------------------------------------------------------------

    ## Vivaldi ##

## Vivaldi freeze after update - AppImage
    ## Remove Bookmarks and restart, after can restore the Bookmarks
    cd ~/.config/vivaldi/Default/

    mv Bookmarks Bookmarks2

    ## Start Vivaldi and close

    mv Bookmarks2 Bookmarks

-------------------------------------------------------------------------------

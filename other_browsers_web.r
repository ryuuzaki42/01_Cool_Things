
    ## other_browsers_web ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 11/11/2026
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

## Wrong time zone
    # LibreWolf shows the wrong time zone because it forces privacy.resistFingerprinting (RFP) to true,
    # which spoofs the time to UTC to prevent tracking
    ## Disable Resist Fingerprinting - Not Recommended for Privacy
        about:config

        privacy.resistFingerprinting.
            true > false

## Add google as search engine in URL bar
    about:preferences#search
        Go to the bottom and add search engine

    ## Fill with
        google
            # exactly or any other, the name Google is blocked

        https://www.google.com/search?q=%s

    It will now appear so you can change it to the default search engine

-------------------------------------------------------------------------------
    ## Chrome ##

## Chrome - Ubuntu Gnome - Asks for password to unlock keyring on startup
    ## Close Chrome

    ## Remove keyrings
        rm ~/.local/share/keyrings/*

    ## Open Chrome
        If asks for password, do not enter one
        Choose Continue and ignore any warnings

-------------------------------------------------------------------------------
    ## Vivaldi ##

## Vivaldi freeze after update - AppImage
    ## Remove Bookmarks and restart, after can restore the Bookmarks
    cd ~/.config/vivaldi/Default/

    mv Bookmarks Bookmarks2

    ## Start Vivaldi and close

    mv Bookmarks2 Bookmarks

-------------------------------------------------------------------------------
## Cool sites for coding
    ## Hackerrank
        https://www.hackerrank.com/

    ## URI Online Judge - Problems & Contests
        https://www.urionlinejudge.com.br/

        ## Changed to beecrowd
            https://www.beecrowd.com.br/

    ## Interview Bit
        https://www.interviewbit.com/

    ## Code Fights
        https://codefights.com/

    ## Online compiler
        https://www.programiz.com/c-programming/online-compiler/
        https://replit.com/
        https://www.onlinegdb.com/
        https://www.programiz.com/html/online-compiler/
        https://www.programiz.com/python-programming/online-compiler/

    ## Visualization of data structures and algorithms
        https://csvistool.com/
        https://www.cs.usfca.edu/~galles/visualization/Algorithms.html
        https://visualgo.net/
        https://algorithm-visualizer.org/

    ## Fun Sites
        https://www.nayuki.io/
        https://nihey.org/
        https://try.github.io/

-------------------------------------------------------------------------------

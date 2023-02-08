## Firefox changes ##
#
# Last update: 08/02/2023
#
about:config

## Disable quit shortcut (Ctrl + Q)
browser.quitShortcut.disabled
    false > true

## Use tmp folder to download the files open by the browser
browser.download.start_downloads_in_tmp_dir
    false > true

## Disable cache of 5 tabs recently seen
browser.sessionhistory.max_total_viewer
    -1 > 0

## Show all URL
browser.urlbar.trimURLs
    true > false

## URL more easy to read - Removed in new versions
browser.urlbar.formatting.enabled
    true > false

## Disable all animate
    search for animate, and set all to false

## Disables geolocation
geo.enabled

## Disable Google Safe Browsing malware checks. Security risk, but privacy improvement
browser.safebrowsing.malware.enabled
services.sync.prefs.sync.browser.safebrowsing.malware.enabled

## Disable that websites can get notifications if you copy, paste, or cut something
## from a web page, and it lets them know which part of the page had been selected
dom.event.clipboardevents.enabled = false
    ## Facebook stop work with links pasted in chat

## The attribute would be useful for letting websites track visitors’ clicks
browser.send_pings

## Website owners can track the battery status of your device
dom.battery.enabled

## Select all URL - Removed in new versions
browser.urlbar.clickSelectsAll
    false > true

## Open a search from the search bar in a new tab if you use the return key to trigger the search
browser.search.openintab
    false > true

## Increase the speed of the scroll - Removed in new versions
mousewheel.system_scroll_override_on_root_content.enabled
    false > true

## Disable autoplay video
    about:preferences#privacy
    > Autoplay > Settings
        > Block Audio and Video

## Program to open magnet links (torrent)
    about:config > new > boolean > name
network.protocol-handler.expose.magnet
    > false

    Open the magnet link:
magnet:?xt=

    And choose a program
/usr/bin/ktorrent
    or
/usr/bin/qbittorrent

## Steam to open links
    about:config > new > boolean > name
network.protocol-handler.expose.steam
    > false

    Open the link:
steam://run/

    And choose Steam
/usr/bin/steam

## Telegram to open links
    about:config
        > new > boolean > name
network.protocol-handler.expose.tg
    > false

    ## Create a link by opening the following URL
data:text/html,<a href="tg://resolve?domain=Bold">Link</a>

    ~/.config/mimeapps.list
        x-scheme-handler/tg=telegram_opera.desktop;

    ## Firefox
        > about:preferences#general > about:preferences#general
            tg >
                Use telegram_run.sh

            # Obs: My install telegram folder is: /media/sda2/home/j/.0installed/Telegram/
            > telegram_run.sh
#!/bin/bash

cd /media/sda2/home/j/.0installed/Telegram/
#Exec=~/.0installed/Telegram/Telegram -workdir ~/.local/share/TelegramDesktop/ -- %u
link=$* # To Firefox
if [ "$link" != "" ]; then
    echo "link: $link"
    #LC_TIME=pt_BR.UTF-8 ./Telegram
    LC_TIME=en_IE.UTF-8 ./Telegram -workdir ~/.local/share/TelegramDesktop/ -- $link
else
    LC_TIME=en_IE.UTF-8 ./Telegram -workdir ~/.local/share/TelegramDesktop/ -- %u
fi

        ## Opera and others
            > telegram_opera.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Name=Telegram
Comment=Official desktop version of Telegram messaging app
Exec=~/.0installed/Telegram/Telegram -workdir ~/.local/share/TelegramDesktop/ -- %u
Icon=/media/sda2/home/j/.0installed/Telegram/0not_change/telegram.png
Terminal=false
StartupWMClass=Telegram
Type=Application
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;
X-GNOME-UsesNotifications=true

## Enabled the spell check in all field text
layout.spellcheckDefault
    0 - Disable in all place
    1 - Some box of text
    2 - Enable in all box of text

## Remove message "Full screen"
full-screen-api.warning.delay
    500 > 0

full-screen-api.warning.timeout
    3000 > 0

## Define initial zoom to open PDF files
pdfjs.defaultZoomValue
    page-width

## Install ffmpeg to full support to HTML5
    # To test: https://www.youtube.com/html5

## Disable Pocket
extensions.pocket.enabled
    true > false

browser.toolbarbuttons.introduced.pocket-button
    true > false

## How to prevent against homograph phishing attacks
    # http://thehackernews.com/2017/04/unicode-Punycode-phishing-attack.html
network.IDN_show_punycode
    false > True

## Change your block list
    Preferences > Privacy & Security > Tracking Protection section
        Change Block List to "Disconnect.me strict protection. Block known trackers"
            > CAPTCHA (Google) and Steam store, do not load correctly

## How to prevent Firefox Resources Reader
    ## Older bug, not work in newer version
    # https://fingerprint-em-portugues.neocities.org/
    # https://browserleaks.com/firefox
https://addons.mozilla.org/firefox/addon/no-resource-uri-leak/

## Enable multiprocess (Firefox 54 and up)
about:support

    ## Look for ...
    "1/1 (Enabled by default)" - multiprocess feature is working
    "0/x (Disabled by add-ons)" - multiprocess is not working

    ## See add-ons that is not compatible with multiprocess
    https://addons.mozilla.org/firefox/addon/add-on-compatibility-reporter/
        ## Remove or disable all them

    ## Enable Firefox Multiprocess Feature
    browser.tabs.remote.autostart
        false > true

    ## Set the count of process
    dom.ipc.processCount
        > Set more than 1

## Disable WebRTC
    ## Google meet stop work
    WebRTC is enabled by default, to disable RTCPeerConnection and protect IP addresses leakage,

    media.peerconnection.enabled
        true > false

    media.navigator.enabled
        true > false

## Change search engine to searx
    https://searx.me/about#

## Youtube older version, Polymer Off
    link + ?disable_polymer=true

    ## playlist:
        link + &disable_polymer=true

    ## Muilt select for Youtube
        https://addons.mozilla.org/firefox/addon/multiselect-for-youtube/

    ## For all link use one script
        https://greasyfork.org/en/scripts/39405-youtube-classic-for-2018-polymer-disable/code

## Dictionaries & Language Packs
    # https://addons.mozilla.org/en-GB/firefox/language-tools/
https://addons.mozilla.org/firefox/addon/verificador-ortogr%C3%A1fico-para-p/
https://addons.mozilla.org/firefox/addon/british-english-dictionary-2/

## Good add-ons
    ## enabled
https://addons.mozilla.org/firefox/addon/adblock-plus/
    + Block additional tracking
    + Block cookie warnings
    + Block push notifications
    + Block social media icons tracking

    + Show acceptable ads
        + Only allow ads without third-party tracking

    > Language filter lists
        - English (EasyList)
        + português + English (EasyList Portuguese+EasyList)

    ## Give error in some website - Add to "Allowlisted websites"
        pelando.com.br

https://addons.mozilla.org/pt-BR/firefox/addon/display-inline/
    ## Change the Content headers to force images and PDF to open in the browser
        ## Works with
            overleaf.com

    ## Give error when use the download option in some website
        https://www.tablesgenerator.com/

https://addons.mozilla.org/firefox/addon/remove-tracking-params/
    ## Give error in some website theses parameters
        pelando.com.br
        aliexpress.com

https://addons.mozilla.org/firefox/addon/sponsorblock/
    https://sponsor.ajay.app/

    ## Disabled
https://addons.mozilla.org/firefox/addon/browsec/
        ## VPN
https://addons.mozilla.org/firefox/addon/export-tabs-urls-and-titles/
https://addons.mozilla.org/firefox/addon/languagetool/
    Add to Firefox and login
        https://languagetool.org/
            E-mail and password on Keep

https://addons.mozilla.org/firefox/addon/hls-downloader-extension/
https://addons.mozilla.org/firefox/addon/print-friendly-pdf/
https://addons.mozilla.org/firefox/addon/hls-stream-detector/
https://addons.mozilla.org/firefox/addon/video-downloadhelper/
https://www.zotero.org/download/

    ## Others
https://addons.mozilla.org/firefox/addon/blackbox/
https://addons.mozilla.org/firefox/addon/fireshot/
https://addons.mozilla.org/firefox/addon/cleancopyurl/
https://addons.mozilla.org/firefox/addon/unload-tabs/
https://addons.mozilla.org/firefox/addon/bookmarks-clean-up/
https://addons.mozilla.org/firefox/addon/behind_the_overlay/
https://addons.mozilla.org/firefox/addon/copy-as-plain-text-webext/
https://addons.mozilla.org/firefox/addon/web-developer/
https://addons.mozilla.org/firefox/addon/touch-vpn/
https://addons.mozilla.org/firefox/addon/discard/
https://addons.mozilla.org/firefox/addon/popup-blocker-lite/
https://addons.mozilla.org/firefox/addon/darkreader/
https://addons.mozilla.org/firefox/addon/downthemall/
    ## Create a new folder, in the Mask add a folder name and the \ or /:
    folderName\*name*.*ext*

    ## Others 2
https://addons.mozilla.org/firefox/addon/grammarly-1/
https://en.savefrom.net/9/user.php?vid=387#download
https://addons.mozilla.org/firefox/addon/print-edit/
https://addons.mozilla.org/firefox/addon/baixou-agora/
https://www.desprotetor.com/
https://addons.mozilla.org/firefox/addon/video-blocker/
https://addons.mozilla.org/firefox/addon/kindle-it/
https://addons.mozilla.org/firefox/addon/user-agent-string-switcher/
https://zenmate.com/
https://www.eff.org/https-everywhere
https://addons.mozilla.org/firefox/addon/donottrackplus/
https://addons.mozilla.org/firefox/addon/tab-notifier/
https://addons.mozilla.org/firefox/addon/flagfox/
https://addons.mozilla.org/firefox/addon/easy-youtube-video-download/
https://addons.mozilla.org/firefox/addon/blank-your-monitor-easy-readin/

## Reset the programs to open file
    ## Go to
~/.mozilla/firefox/

    ## Enter in the $profile$/ folder in use
        about:profiles

    ## Rename the file handlers.json
        mv handlers.json handlers2.json

## New version of Firefox using new profile
    ## Open the management of profiles
        about:profiles

    ## Launch the Firefox with the "old" profile
    ## Close the Windows using the "new" profile
    ## In the other window, open management profile and delete the "new" profile deleting files

## Error
    ## The site at <site> has experienced a network protocol violation that cannot be repaired
        try reload the page (Crtl + F5) and/or delete the cache in: about:preferences#privacy -> Clear Data

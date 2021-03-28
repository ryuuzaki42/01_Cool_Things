### Firefox changes ###

## Disable cache of 5 tabs recently seen
browser.sessionhistory.max_total_viewer
    -1 > 0

## Show all URL
browser.urlbar.trimURLs
    true > false

## URL more easy to read
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

## Select all URL
browser.urlbar.clickSelectsAll
    false > true

## Open a search from the search bar in a new tab if you use the return key to trigger the search
browser.search.openintab
    false > true

## Increase the speed of the scroll
mousewheel.system_scroll_override_on_root_content.enabled
    false > true

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
    about:config > new > boolean > name
network.protocol-handler.expose.tg
    > false

    Create a link by opening the following URL
data:text/html,<a href="tg://resolve?domain=Bold">Link</a>

    And choose Telegram (or look for the executable file)

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

## Install ffmpeg to full support to html5
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

    # playlist:
        link + &disable_polymer=true

    ## For all link use one script
        https://greasyfork.org/en/scripts/39405-youtube-classic-for-2018-polymer-disable/code

## Dictionaries & Language Packs 
    # https://addons.mozilla.org/en-GB/firefox/language-tools/
https://addons.mozilla.org/firefox/addon/verificador-ortogr%C3%A1fico-para-p/
https://addons.mozilla.org/firefox/addon/british-english-dictionary-2/

## Remove Tracking Parameters
https://addons.mozilla.org/firefox/addon/remove-tracking-params/

## Clean copy URL
https://addons.mozilla.org/firefox/addon/cleancopyurl/

## Video DownloadHelper
https://addons.mozilla.org/firefox/addon/video-downloadhelper/

## Good add-ons
https://addons.mozilla.org/firefox/addon/inlinedisposition-webexts/
https://addons.mozilla.org/firefox/addon/popup-blocker-lite/

## Downthemall
https://addons.mozilla.org/pt-BR/firefox/addon/downthemall/
    ## Create a new folder, in the Mask add a folder name and the \ or /:
    folderName\*name*.*ext*

## Others in use
https://addons.mozilla.org/firefox/addon/adblock-plus/

https://addons.mozilla.org/firefox/addon/touch-vpn/
https://addons.mozilla.org/pt-BR/firefox/addon/discard/
https://addons.mozilla.org/firefox/addon/web-developer/
https://addons.mozilla.org/firefox/addon/export-tabs-urls-and-titles/

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

## Others
http://en.savefrom.net/user.php?vid=387#download
https://addons.mozilla.org/firefox/addon/unload-tabs/
https://addons.mozilla.org/firefox/addon/print-edit/
https://addons.mozilla.org/firefox/addon/grammarly-1/
http://www.baixou.com.br/baixouagora
https://addons.mozilla.org/firefox/addon/flashstopper/
https://addons.mozilla.org/firefox/addon/gnotifier/
https://desprotetor.com.br/download
https://addons.mozilla.org/firefox/addon/video-blocker/
https://addons.mozilla.org/firefox/addon/kindle-it/
https://addons.mozilla.org/firefox/addon/behind_the_overlay/
https://addons.mozilla.org/firefox/addon/user-agent-switcher-firefox/
https://zenmate.com/
https://addons.mozilla.org/firefox/addon/google-br/
    Change the default "search"
https://addons.mozilla.org/firefox/addon/flashgot/
https://www.eff.org/https-everywhere
https://addons.mozilla.org/firefox/addon/private-tab/
https://addons.mozilla.org/firefox/addon/copy-as-plain-text/
https://addons.mozilla.org/firefox/addon/blank-your-monitor-easy-readin/
https://addons.mozilla.org/firefox/addon/donottrackplus/
https://addons.mozilla.org/firefox/addon/tab-notifier/
https://addons.mozilla.org/firefox/addon/flagfox/
https://addons.mozilla.org/firefox/addon/download-youtube/
https://addons.mozilla.org/firefox/addon/download-flash-and-video/

## Error
    ## The site at <site> has experienced a network protocol violation that cannot be repaired
        try reload the page (Crtl + F5) and/or delete the cache in: about:preferences#privacy -> Clear Data

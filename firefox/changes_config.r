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

## Disable
# Disables geolocation
geo.enabled

# Disable Google Safe Browsing malware checks. Security risk, but privacy improvement
browser.safebrowsing.malware.enabled
services.sync.prefs.sync.browser.safebrowsing.malware.enabled

# Disable that websites can get notifications if you copy, paste, or cut something
# from a web page, and it lets them know which part of the page had been selected
dom.event.clipboardevents.enabled = false
    ## Facebook stop work with links pasted in chat

# The attribute would be useful for letting websites track visitors’ clicks
browser.send_pings

# Website owners can track the battery status of your device
dom.battery.enabled

## Popups and others events
dom.popup_allowed_events
    change click dblclick mouseup notificationclick reset submit touchend
    > delete text

## Select all URL
browser.urlbar.clickSelectsAll
    false > true

## Aumentar velocidade do scroll
mousewheel.system_scroll_override_on_root_content.enabled
    false > true

## Program to open magnet links (torrent)
    new > boolean > name
    network.protocol-handler.expose.magnet
    > false

    Open a magnet link and choose a program
    > /usr/bin/ktorrent

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

## Install ffmpeg to use video plugins
    # To test: https://www.youtube.com/html5

## Disable Pocket
extensions.pocket.enabled
    true > false

browser.toolbarbuttons.introduced.pocket-button
    true > false

## Good add-ons
https://adblockplus.org/
    Remove (crtl + shift + v)
        about:config
            extensions.adblockplus.sidebar_key
https://addons.mozilla.org/firefox/addon/disable-ctrl-q-shortcut/
https://addons.mozilla.org/firefox/addon/gnotifier/
https://addons.mozilla.org/firefox/addon/inlinedisposition-webexts/

https://addons.mozilla.org/firefox/addon/print-edit/
https://addons.mozilla.org/firefox/addon/grammarly-1/
https://addons.mozilla.org/firefox/addon/flashstopper/
http://en.savefrom.net/user.php?vid=387#download
https://addons.mozilla.org/firefox/addon/adblock-plus-pop-up-addon/
    http://jessehakanen.net/adblockpluspopupaddon/#download
        Block all pop-ups
http://www.baixou.com.br/baixouagora
https://desprotetor.com.br/download
https://addons.mozilla.org/firefox/addon/video-blocker/
https://addons.mozilla.org/firefox/addon/kindle-it/
https://addons.mozilla.org/firefox/addon/behind_the_overlay/
https://addons.mozilla.org/firefox/addon/user-agent-switcher-firefox/
https://addons.mozilla.org/firefox/addon/video-downloadhelper/
https://zenmate.com/
https://addons.mozilla.org/firefox/addon/google-br/
    Change the search
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

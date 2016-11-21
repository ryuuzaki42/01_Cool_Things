### Firefox changes ###

## destativar cache de 5 abas recem visitadas
browser.sessionhistory.max_total_viewer
    > -1 para 0

## Mostrar url completa
browser.urlbar.trimURLs
    > true para false

## Selecionar toda url
browser.urlbar.clickSelectsAll
    > false para true

## Aumentar velocidade do scroll
mousewheel.system_scroll_override_on_root_content.enabled
    > false para true

## Associar links magnéticos (torrent) no Firefox
    about:config
    Nova entrada com o botão direito e acesse o menu: Nova referência → Boolean...
    ## Como nome, coloque:
    network.protocol-handler.expose.magnet
    Quando perguntado se é TRUE ou FALSE, marque: FALSE
    Na próxima vez que clicar num link magnético, aparecerá uma janela perguntando com que programa deseja abrir o link
    Escolha o caminho: "/usr/bin/ktorrent" e marque para lembrar sempre dessa escolha

## Habilitar o corretor ortográfico em todos os campos de texto
layout.spellcheckDefault
    0 - Desabilita em todas caixas de texto
    1 - Algumas caixas de texto
    2 - Em todas caixas de texto

## Remover mensagem "Tela cheia"
full-screen-api.warning.delay
    > 500 para 0

full-screen-api.warning.timeout
    > 3000 para 0

## Definir zomm incial para arquivo pdf
pdfjs.defaultZoomValue
    > page-width

## Good add-ons
    ## habilitado:
https://adblockplus.org/
    > Remove (crtl + shift + v) > about:config > extensions.adblockplus.sidebar_key
https://addons.mozilla.org/firefox/addon/adblock-plus-pop-up-addon/
    http://jessehakanen.net/adblockpluspopupaddon/#download
    > Block all pop-ups
https://addons.mozilla.org/firefox/addon/disable-ctrl-q-shortcut/
https://addons.mozilla.org/firefox/addon/flashstopper/
https://addons.mozilla.org/firefox/addon/gnotifier/
    > Notification expiration
https://addons.mozilla.org/firefox/addon/google-br/
    > Change the search
https://addons.mozilla.org/firefox/addon/flashgot/
https://addons.mozilla.org/firefox/addon/grammarly-1/

    ## desabilitado
http://www.baixou.com.br/baixouagora
https://desprotetor.com.br/download
https://addons.mozilla.org/firefox/addon/video-blocker/
https://addons.mozilla.org/firefox/addon/kindle-it/
https://addons.mozilla.org/firefox/addon/behind_the_overlay/
https://addons.mozilla.org/firefox/addon/user-agent-switcher-firefox/
https://addons.mozilla.org/firefox/addon/inlinedisposition/
https://addons.mozilla.org/firefox/addon/video-downloadhelper/

## others
https://zenmate.com/
https://www.eff.org/https-everywhere
https://addons.mozilla.org/firefox/addon/private-tab/
https://addons.mozilla.org/firefox/addon/copy-as-plain-text/
https://addons.mozilla.org/firefox/addon/blank-your-monitor-easy-readin/
https://addons.mozilla.org/firefox/addon/donottrackplus/
https://addons.mozilla.org/firefox/addon/tab-notifier/
https://addons.mozilla.org/firefox/addon/flagfox/
https://addons.mozilla.org/firefox/addon/download-youtube/
https://addons.mozilla.org/firefox/addon/download-flash-and-video/

## New tab as blank
browser.newtab.url
    about:newtab > about:blank

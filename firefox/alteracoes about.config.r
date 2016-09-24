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
    0 - Desabilita  1 - Algumas caixas de texto - 2 Em todas caixas de texto

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
https://addons.mozilla.org/en-US/firefox/addon/adblock-plus-pop-up-addon/
    > Block all pop-ups
https://addons.mozilla.org/en-US/firefox/addon/copy-as-plain-text/
https://addons.mozilla.org/en-US/firefox/addon/disable-ctrl-q-shortcut/
https://addons.mozilla.org/en-US/firefox/addon/flashstopper/
https://addons.mozilla.org/en-US/firefox/addon/gnotifier/
    > Notification expiration
https://addons.mozilla.org/pt-br/firefox/addon/google-br/
    > Change the search
https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher-firefox/

    ## desabilitado
https://addons.mozilla.org/en-us/firefox/addon/behind_the_overlay/
https://addons.mozilla.org/it/firefox/addon/blank-your-monitor-easy-readin/
https://desprotetor.com.br/download
https://addons.mozilla.org/en-US/firefox/addon/inlinedisposition/
https://addons.mozilla.org/en-US/firefox/addon/private-tab/
https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/

## Outros
https://zenmate.com/
https://www.eff.org/https-everywhere
https://addons.mozilla.org/en-US/firefox/addon/donottrackplus/
https://addons.mozilla.org/en-US/firefox/addon/tab-notifier/
https://addons.mozilla.org/en-US/firefox/addon/flagfox/
https://addons.mozilla.org/en-US/firefox/addon/download-youtube/
https://addons.mozilla.org/en-US/firefox/addon/download-flash-and-video/

###
Na nova aba colocar aba em branco
browser.newtab.url 
about:newtab para about:blank

#
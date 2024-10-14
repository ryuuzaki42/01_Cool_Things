
    ## LibreOffice

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 14/10/2024
#

## Error message “Unspecified Application Error” after running it
    ## Add to script
        nano /usr/lib64/libreoffice/program/soffice

## added ryuuzaki42
export MESA_LOADER_DRIVER_OVERRIDE=i965
##

## Delete the folders/files - Make light theme work
    .config/
        gtk-2.0/
        gtk-3.0/
        gtk-4.0/

    ## Can edit only edit the files
        .config/gtk-3.0/settings.ini
        .config/gtk-4.0/settings.ini

        > gtk-application-prefer-dark-theme=true
            > gtk-application-prefer-dark-theme=

        > gtk-icon-theme-name=breeze-dark
            > gtk-icon-theme-name=

    ## After deleted, disable the service
        System Settings > Startup and Shutdown > Background Services
            > GNOME/GTK Settings Synchronize Service

        This service create .config/gtk-?.0/ folders with configuration similar with KDE

## Minhas configurações
    Ferramentas > Opções

        > Language Setting
            > Interface
                Portuguese (Brazil)

            > Locale Setting
                Portuguese (Brazil)

            > Apply and Restart

        > LibreOffice
            > Dados do Usuário
                > Nome
                    João Batista

        > Geral
            > Dicas Extendidas

        > Exibir
            > Modo
                Claro

            > Tema
                Breeze

            > Tamanho dos icones
                3 x Grande

            > Menu
                Mostrar


## LibreOffice Writer - Make typing cursor more visible in Writer
    # LibreOffice Writer - Typing cursor (caret, not the mouse pointer) appearance
    ~/.config/gtk-3.0/gtk.css

    ## Add
        * { -GtkWidget-cursor-aspect-ratio: 0.2; }

## LibreOffice without icons
    Switch to another icon style in the Tools > Option > Libreoffice > View > Icon Menu, for example 'tango'

## LibreOffice sem icones?
    # https://ask.libreoffice.org/t/why-did-the-icons-disappear-in-the-menus-of-version-6-4/50875/4
    # https://forums.linuxmint.com/viewtopic.php?t=337850

    Ferramentas > Opções > LibreOffice > Avançado
        > Configuração para especialistas

        Busque por:
            IconsInMenu

            ShowIconsInMenues → true
            IsSystemIconsInMenus → false

    > Renicie o LibreOffice

## Colocar ponto (.) no lugar de virgula (,) para separar casas decimais
    Mude o Local setting: English (UK)
    ou altere as configurações da aba do documento
    ## Para aceitar um novo padrão de linguagem, terá que reiniciar

## Substituir . por ,
    Editar > Localizar e Substituir...
        . por ,
            > Somente na seleção atual

## Calc
    ## Export sheet to PDF
        ## Change Page Style before export
        Format > Page Style
            > Page
                > Orientation
                    > Portrait or Landscape

                > Margins
                    Left:   2.0 cm > e.g., 0.1 cm
                    Right:  2.0 cm > e.g., 0.1 cm
                    Top:    2.0 cm > e.g., 1.0 cm
                    Bottom: 2.0 cm

            > Header
                > Disable or change some configuration
                    ## Disable to remove sheet name

            > Footer
                > Disable or change some configuration
                    ## Disable to remove page name

        ## Zoom
            File > Print Preview
                Adjust the content size with the zoom slider

            ## Or with more difficulty
                Format > Page Style > Sheet
                    > Scalling mode > Reduce/enlarge printout
                        > e.g., 105% or 85%

        ## Export
            File > Export as PDF...

    ## Column/Row Highlighting for Active Cell - Version LibreOffice 24.2.0 and up
        # https://wiki.documentfoundation.org/ReleaseNotes/24.2
        Tools > Options > LibreOffice Calc > View

        Or through the menu entry
            View > Column/Row Highlighting

    ## Copying column width
        The column width will be copied, by Ctrl-C / Ctrl-V, when select and copy a whole column
        Copy and plast the whole column and move the data
        The individual cells have not "Column width" property

## Impress URL não aparecendo em azul e sublinhada
    Crie um nova apresentação com as URL, tipo refs.odp, com as referências
    Faça o upload dela no Google Drive e depois de "editar" elas e reconhecer as URLs
    Baixe em formato odp e copie elas para apresentação desejada

## Reduzir Tamanho de apresentação odp
    Abrir apresentação com ark (como arquivo "zipado")

    Procurar os maiores arquivos
        Geralmente em "Pictures/", ordenar por tamanho

        Depois alterar a imagem no Impress

            Na imagem, Botão direito do mouse > Comprimir > Qualidade JPEG > 80 %

            Ou substituir a imagem, ou editar com ferramenta exterma

-----------------------------------------------------------------------

## Salvar de tempos em tempos automaticamente
    Ferramentas > Opções > Carregar/Salvar > Salvar
        > Salvar informações de autorecuperação a cada 10 minutos

## Errors:
    (soffice:5736): GLib-GObject-CRITICAL **: g_object_ref: assertion 'G_IS_OBJECT (object)' failed
    (soffice:5736): Gtk-CRITICAL **: gtk_container_remove: assertion 'GTK_IS_WIDGET (widget)' failed
    (soffice:5736): Gtk-CRITICAL **: gtk_container_add: assertion 'GTK_IS_WIDGET (widget)' failed
    (soffice:5736): GLib-GObject-CRITICAL **: g_object_unref: assertion 'G_IS_OBJECT (object)' failed

    ## Do
        cd /usr/lib64/libreoffice/program/
        mv libvclplug_gtk3lo.so libvclplug_gtk3lo.so2

    ## Or
        export SAL_USE_VCLPLUGIN=gtk; libreoffice

    ## Or
        nano /usr/lib64/libreoffice/program/soffice

        ## and add
            export SAL_USE_VCLPLUGIN=gtk

## LibreOffice: updated to 6.4.6 for Slackware 14.2.
    Note: LO Base crashes on startup unless you define "SAL_USE_VCLPLUGIN=gen"

## LibreOffice version 7 Alien Bob
    # https://alien.slackbook.org/blog/libre-office-7-packages-for-slackware-current/

    Java support dropped from the libreoffice Slackware package
    To use extension, go to version 6.x.x
     ## Or install 6.x.x, instal extension (like cogroo) and after update to last version 7.x.x

## Error message “Unspecified Application Error” after running it
    ## Before starting LibreOffice
        export MESA_LOADER_DRIVER_OVERRIDE=i965

        ## Add to script
            nano /usr/lib64/libreoffice/program/soffice

    ## or
        export MESA_LOADER_DRIVER_OVERRIDE=

## cogroo - enable
    ## Donwload and install .oxt
        http://cogroo.org/download/current.html

            oxt/cogroo-4.0.0.oxt

    ## Verificar
        > Ferramentas > Corretor Gramatical CoGrOO > Reiniciar verificação

## LanguageTools - enable
    ## Download and install o .oxt
        https://languagetool.org/pt-BR/libre-office

            oxt/LanguageTool-stable.oxt

    ## Ativar
        > Ferramentas > Opções ... > Configurações de Idioma > Configurações do servidor LanguageTools
            > Ativar o LanguageTool

    ## Verificar
        > Writer
            Fomos levados à crer.

        > Ferramentas > Gramática > Verificar

## LibreOffice light theme
    ls /usr/share/themes/

    > Ferramentas > Opções ... > LibreOffice > Exibir
        > Tema: Breeze

    GTK_THEME=Canta libreoffice

    ## Other options - edit .desktop
        GTK_THEME=Yaru libreoffice

        GTK_THEME=Adwaita libreoffice

            GTK_THEME=Adwaita:light libreoffice

            GTK_THEME=Adwaita:dark libreoffice

    SAL_USE_VCLPLUGIN=gen libreoffice

    SAL_USE_VCLPLUGIN=gtk libreoffice

    SAL_USE_VCLPLUGIN=gtk3 libreoffice

    SAL_USE_VCLPLUGIN=gtk3 libreoffice

## New document creation arguments - Creates an empty:
   --writer  - Writer
   --calc    - Calc
   --draw    - Draw
   --impress - Impress
   --base    - database
   --global  - Writer master (global)
   --math    - Math document (formula)
   --web     - HTML

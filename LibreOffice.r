
    ## LibreOffice

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 29/02/2024
#

## LibreOffice Writer - Make typing cursor more visible in Writer
    # LibreOffice Writer - Typing cursor (caret, not the mouse pointer) appearance
    ~/.config/gtk-3.0/gtk.css

    ## Add
        * { -GtkWidget-cursor-aspect-ratio: 0.2; }

## LibreOffice without icons
    Switch to another icon style in the Tools > Option > Libreoffice > View > Icon Menu, for example 'tango'

## LibreOffice: Colocar ponto (.) no lugar de virgula (,) para separar casas decimais
    Mude o Local setting: English (UK)

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
    #https://wiki.documentfoundation.org/ReleaseNotes/24.2

    Highlight the row and column for the active cell.
        Tools ▸ Options ▸ LibreOffice Calc ▸ View

        Or through the menu entry
        View ▸ Column/Row Highlighting

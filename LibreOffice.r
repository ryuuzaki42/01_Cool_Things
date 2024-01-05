
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

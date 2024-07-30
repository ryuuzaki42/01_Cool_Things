
## VSCode - VSCodium #

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 30/07/2024
#

## VSCode - with Microsoft telemetry/tracking
    https://code.visualstudio.com/Download

## VSCodium - without Microsoft telemetry/tracking
    https://vscodium.com/

    ## Also with AppImage
        https://github.com/VSCodium/vscodium/releases

## Shortcuts
    Settings: Ctrl + ,
    Command Palette: Ctrl + Shif + P
    Run code by default file: Ctrl + F5

    ## Indent code
        Linux   Ctrl + Shift + I
        Windows Shift + Alt + F
        Mac     Shift + Option + F

## General
    ## Configuration folder
        ~/.config/VSCodium/User/
            workspaceStorage/"project"/
            settings.json

    ## Word Wrap
        Settings > Word Wrap
            Off > On

    ## Minimap
        Settings > View: Toggle Minimap

    ## Mouse Wheel Zoom holding Ctrl
        ## Zoom the font of the editor when using the mouse wheel and holding Ctrl
        Settings > Mouse Wheel Zoom
            Editor: Mouse Wheel Zoom
                > On

            Terminal: Mouse Wheel Zoom
                > On

    ## Terminal count lines scroll back
        Settings > Terminal:Configure Terminal Settings
            Integrated: Scrollback >
                1000 > 5000

    ## Show white space
        Settings > renderWhitespace
            > trailing

    ## Trim trailing white space on save
        Settings > trimTrailingWhitespace
            > On

    ## Code Spell Checker
        ## Install extension:
            Code Spell Checker
            Brazilian Portuguese - Code Spell Checker
                F1 > Show Spell Checker Configuration Info
                    Select the User tab.
                        Enable the language.

                Or, Settings > cSpell.language
                    > en,pt-BR

## Python
    ## Install extension:
        Python (Python and Python Debugger)
        Pylint - To see code error and suggestions

    ## Jupyter notebook
        Install extension:
            Jupyter (Jupyter, Jupyter Cell Tags, Jupyter Keymap, Jupyter Notebook Renderers, Jupyter Slideshow)

    ## Select virtual environment to run
        Ctrl + Shift + P
            > Python: Select Interpreter
                Select the path to "my_env/bin/Python3"

        Then, if needed, change the Kernel in Select Kernel (bottom right corner)
            Select the Interpreter added in the previous step

## C
    ## Install extension:
        clangd (C/C++ completion, navigation, and insights)

## HTML
    ## Create default document
        ! + enter

    ## Create tags
        h1 + enter
        img + enter

## Default file to start run
    ## Create a launch.json
        Run and Debug (Ctrl + Shif + D)
            > create a launch.json file.

    ## In launch.json file edit the "program" to the correct file
        "program": "${file}",

        ## For example:
            "program": "${workspaceFolder}/main.py",

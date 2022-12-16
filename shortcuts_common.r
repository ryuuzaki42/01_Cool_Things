
## Text-Editing Keyboard Shortcuts

## Working With Words
    Ctrl + Left or Right Arrow Keys - Move cursor between words
    Ctrl + Backspace - Delete previous word
    Ctrl + Delete - Delete next word
    Ctrl + Up Arrow - Move cursor to beginning of paragraph
    Ctrl + Down Arrow - Move cursor to end of paragraph

## Moving the Cursor
    Home - Move cursor to beginning of current line
    End - Move cursor to end of current line
    Ctrl + Home - Move cursor to top of the text entry field
    Ctrl + End - Move cursor to bottom of the text entry field
    Page Up - Move cursor up a frame
    Page Down - Move cursor down a frame

## Selecting Text
    Shift + Left or Right Arrow Keys - Select characters one at a time
    Shift + Up or Down Arrow Keys - Select lines one at a time
    Shift + Ctrl + Left or Right Arrow Keys - Select words
    Shift + Ctrl + Up or Down Arrow Keys - Select paragraphs
    Shift + Home - Select the text between the cursor and the beginning of the current line
    Shift + End - Select the text between the cursor and the end of the current line
    Shift + Ctrl + Home - Select the text between the cursor and the beginning of the text entry field
    Shift + Ctrl + End - Select the text between the cursor and the end of the text entry field
    Shift + Page Down - Select a frame of text below the cursor
    Shift + Page Up - Select a frame of text above the cursor
    Ctrl + A - Select all text

## Editing
    Ctrl + C - Copy selected text
    Ctrl + X - Cut selected text
    Ctrl + V - Paste text at cursor
    Ctrl + Z - Undo
    Ctrl + Y - Redo

## Formatting
    Ctrl + B - Bold
    Ctrl + I - Italic
    Ctrl + U - Underline

## Functions
    Ctrl + F - The find dialog
    F3 - Find next
    Shift + F3 - Find previous
    Ctrl + O - Open
    Ctrl + S - Save
    Ctrl + N - New document
    Ctrl + P - Print
    Alt - Activate application’s menu bar
    Alt + F - Open File menu
    Alt + E - Open Edit menu
    Alt + V - Open View menu

## Bash
    ## Moving
        Ctrl + a - Goto BEGINNING of command line
        Ctrl + e - Goto END of command line
        Ctrl + b - move back one character
        Ctrl + f - move forward one character
        Alt + f - move cursor FORWARD one word
        Alt + b - move cursor BACK one word

    ## Editing
        Ctrl + d - Delete the character under the cursor
        Ctrl + h - Delete the previous character before cursor

        Ctrl + u - cut BEFORE cursor and places it on the clipboard
        Ctrl + k - cut AFTER cursor and places it on the clipboard
        Ctrl + y - paste (if you used a previous command to delete)

        Ctrl + w - delete the word BEFORE the cursor
        Alt + d - delete the word FROM the cursor

        Ctrl + l - Clear the screen (same as clear command)
        Ctrl + c - kill whatever is running
        Ctrl + d - Exit shell (same as exit command when cursor line is empty)

        Ctrl + _ - Undo
        Ctrl + t - Swap the last two characters before the cursor
        Alt + t - swap current word with previous
        Alt + [Backspace] - delete PREVIOUS word
        Alt + . - print the LAST ARGUMENT (ie "vim file1.txt file2.txt" will yield "file2.txt")
        Alt + c - capitalize the first character to end of word starting at cursor (whole word if cursor is at the beginning of word)
        Alt + u - make uppercase from cursor to end of word
        Alt + l - make lowercase from cursor to end of word

        ~[TAB][TAB] - List all users
        $[TAB][TAB] - List all system variables
        @[TAB][TAB] - List all entries in your /etc/hosts file
        [TAB] - Auto complete

    ## History
        Up Arrow key - Move 'up' through the history
        Down Arrow key - Move 'down' through the history
        Ctrl + r - Search backward starting at the current line and
        !! - Run PREVIOUS command (ie sudo !!)
        !vi - Run PREVIOUS command that BEGINS with vi
        !vi:p - Print previously run command that BEGINS with vi
        !n - Execute nth command in history
        !$ - Last argument of last command
        !^ - First argument of last command
        ^abc^xyz - Replace first occurance of abc with xyz in last command and execute it

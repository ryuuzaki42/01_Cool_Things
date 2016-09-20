# Good one
    http://www.computerhope.com/unix/uvi.htm

Where grep came from (RE being Regular Expression):
:g/RE/p

Delete lines 10 to 20 inclusive:
:10,20d
or with marks a and b:
:'a,'bd

Delete lines that contain pattern:
:g/pattern/d

Delete all empty lines:
:g/^$/d

To quit the vi editor without saving any changes you''ve made:
If you are currently in insert or append mode, press Esc.
q!

Delete lines in range that contain pattern:
:20,30/pattern/d
or with marks a and b:
:'a,'b/pattern/d

Substitute all lines for first occurance of pattern:
:%s/pattern/new/
:1,$s/pattern/new/

Substitute all lines for pattern globally (more than once on the line):
:%s/pattern/new/g
:1,$s/pattern/new/g

Find all lines containing pattern and then append -new to the end of each line:
:%s/\(.*pattern.*\)/\1-new/g

Substitute range:
:20,30s/pattern/new/g
with marks a and b:
:'a,'bs/pattern/new/g

Swap two patterns on a line:
:s/\(pattern1\)\(pattern2\)/\2\1/

Capitalize the first lowercase character on a line:
:s/\([a-z]\)/\u\1/
more concisely:
:s/[a-z]/\u&/

Capitalize all lowercase characters on a line:
:s/\([a-z]\)/\u\1/g
more concisely:
:s/[a-z]/\u&/g

Capitalize all characters on a line:
:s/\(.*\)/\U\1\E/

Capitalize the first character of all words on a line:
:s/\<[a-z]/\u&/g

Uncapitalize the first character of all words on a line:
:s/\<[A-Z]/\l&/g

Change case of character under cursor:
~

Change case of all characters on line:
g~~

Change case of remaining word from cursor:
g~w

Increment the number under the cursor:
<Ctrl-A>

Decrement the number under the cursor:
<Ctrl-X>

redraw:
<Ctrl-L>

Turn on line numbering:
:set nu
Turn it off:
:set nonu

Number lines (filter the file through a unix command and replace with output):
:%!cat -n

Sort lines:
:%!sort

Sort on column #69:
:sort /.*\%69v/

Sort and uniq:
:%!sort -u

Read output of command into buffer:
:r !ls -l

Refresh file from version on disk:
:e!

Open a new window:
<Ctrl-W>n

Open a new window with the same file (split):
<Ctrl-W>s

Split window vertically:
<Ctrl-W>v

Close current window:
<Ctrl-W>c
:q

Make current window the only window:
<Ctrl-W>o

Cycle to next window:
<Ctrl-W>w

Move to window below current window:
<Ctrl-W>j

Move to window above current window:
<Ctrl-W>k

Move to window left of current window:
<Ctrl-W>h

Move to window right of current window:
<Ctrl-W>l

Set textwidth for automatic line-wrapping as you type:
:set textwidth=80

Turn on syntax highlighting
:syn on
Turn it off:
:syn off

Force the filetype for syntax highlighting:
:set filetype=python
:set filetype=c
:set filetype=php

Use lighter coloring scheme for a dark background:
:set background=dark

Htmlize a file using the current syntax highlighting:
:so $VIMRUNTIME/syntax/2html.vim

Or, htmlize from a command prompt:
in 2html.sh put:

#!/bin/sh
vim -n -c ':so $VIMRUNTIME/syntax/2html.vim' -c ':wqa' $1 > /dev/null 2> /dev/null

Now just run:  shell> 2html.sh foo.py

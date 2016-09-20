        ## rsync ##

rsync option source-directory destination-directory

## Test "See changes"
rsync -naic d1/ d2/ | grep ">"

## Run
rsync -rv d1/ d2/

## With deleted files
rsync -rv --delete d1/ d2/

## What Is Rsync?
    Rsync is a very flexible network-enabled syncing tool. It can also refer to the network protocol developed to utilize this tool.

## Basic Syntax
    The basic syntax of rsync is very straight forward, and operates in a way that is similar to ssh, scp, and cp.
    We will create two test directories and some test files with the following commands:

mkdir dir1
mkdir dir2
touch dir1/file{1..100}

## To sync the contents of dir1 to dir2 on the same system, type:

rsync -r dir1/ dir2

    The -r option means recursive, which is necessary for directory syncing.
    We could also use the -a flag instead:

rsync -a dir1/ dir2

## An Important Note
    You may have noticed that there is a trailing slash (/) at the end of the first argument in the above commands:

rsync -a dir1/ dir2

    This is necessary to mean "the contents of dir1".
    The alternative, without the trailing slash, would place dir1, including the directory, within dir2. This would create a hierarchy that looks like:

    ~/dir2/dir1/[files]

    Always double-check your arguments before executing an rsync command.
    Rsync provides a method for doing this by passing the -n or --dry-run options. The -v flag (for verbose) is also necessary to get the appropriate output:

rsync -anv dir1/ dir2

## Full sync
    In order to keep two directories truly in sync, it is necessary to delete files from the destination directory if they are removed from the source.
    By default, rsync does not delete anything from the destination directory.
    We can change this behavior with the --delete option. Before using this option, use the --dry-run option and do testing to prevent data loss:

rsync -a --delete source destination

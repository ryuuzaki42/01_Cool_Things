
    ## Script.r - Greats commands for day life ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 30/10/2024
#

## Process with more CPU use
    ps aux --sort=-pcpu | head -n 11

    watch -n1 -e 'ps aux --sort=-pcpu | head -n 11'

## Process with more memory (RAM) use
    ps aux --sort -rss | head -n 11

    watch -n1 -e 'ps aux --sort -rss | head -n 11'

## Print a process tree
    pstree

## Compile C with warning and extras
    gcc -Wall -Wextra -Wpedantic -O3 -ansi -std=c99 prog.c -o prog.out

    # O std pode ser c99 ou c11, para c17 e c18 vai precisar do GCC atual. Leia mais sobre:
    # https://fig.if.usp.br/~esdobay/c/gcc.html
    # https://linux.ime.usp.br/~lucasmmg/livecd/documentacao/documentos/terminal/Compilando_um_arquivo_em_C.html

    ## Generate assembly code from C/C++ code, helloworld.s
        gcc -S helloworld.c

        ## See online
            https://godbolt.org/

    ## Display assembly code form one executable C
        objdump -S prog.out

## Disable KDE Wallet (KWALLET) Pop-ups in Chromium, Google Chrome and Opera
    # for not pop-up every time you open them added in the end of file
    nano ~/.kde/share/config/kwalletrc

[Auto Deny]
kdewallet=Chromium,Opera,Chrome

    # Save and exit the file. Log out and back in again for the changes to take effect,
    # or simply enter the following into the terminal:
    killall -9 kwalletd

## Compactar/Descompactar arquivos/pastas para zip, rar, tar, tar.gz, tar.bz2 e bz2 pelo terminal
    ## zip
        ## Compactar
            zip arquivo.zip arquivo

            zip -r pasta.zip pasta/

        ## zip files with a size limit
            zip -s 10m archive.zip archive

            zip -r -s 400m archive.zip directory/

            ## Compress Speed
                (-0, -1, -2, -3, -4, -5, -6, -7, -8, -9)
                Regulate the speed of compression using the specified digit #,
                where -0 indicates no compression (store all files),
                -1 indicates the fastest compression speed (less compression)
                and -9 indicates the slowest compression
                speed (optimal compression, ignores the suffix list). The default compression level is -6

            zip -1 -r -s 400m archive.zip directory/

        ## Convert a split archive to a single-file archive, first "unsplit"
            zip -s 0 archive.zip --out unsplit.zip
                ## Then you unzip the unsplit file:
                    unzip unsplit.zip

        ## Descompactar
            unzip arquivo.zip

    ## rar
        ## Compactar
            rar a arquivo.rar arquivo

            rar a pasta.rar pasta/

        ## Descompactar
            unrar x arquivo.rar

    ## tar
        ## Compactar # c
            tar -cf arquivo.tar arquivo

            ## f pasta/folder
            tar -cvf pasta.tar pasta/

        ## Descompactar # x
            tar -xvf arquivo.tar

    ## tar.gz # -z, --gzip
        ## Compactar
            tar -zcf arquivo.tar.gz arquivo

            tar -zcvf pasta.tar.gz pasta/

        ## Descompactar
            tar -zxvf arquivo.tar.gz

    ## tar.bz2 e bz2 # -j, --bzip2
        ## Compactar
            tar -jcv arquivo.tar.bz2 arquivo

            tar -jcvf pasta.tar.bz2 pasta/

        ## Descompactar
            tar -jxvf arquivo.tar.bz2

## echo shell commands as they are executed
    set -x : expands variables and prints a little + sign before the line
    set -v : does not expand the variables before printing

    ## To turn off use + instead -
        set +x - set +v

## Simples online multicore CPU benchmarking service
    https://silver.urih.com/

## Wi-Fi connect on terminal with NetworkManager
    nmtui

    ## NetworkManager - files with config and passwords
        /etc/NetworkManager/system-connections/

## man
    man man - format and display the on-line manual pages

        -f, --whatis
            Equivalent to whatis - display one-line manual page descriptions

            man -f ip
            whatis ip

            man -f gets - search in the manual pages gets
                gets (3) - get a string from standard input (DEPRECATED)
                gets (n) - Read a line from a channel

        -k, --apropos
            Equivalent to apropos - search the manual page names and descriptions

            apropos ip
            man -k ip

        -K, --global-apropos
            Search for text in all manual pages

            man -K ip

    man units - decimal and binary prefixes
    man url - uniform resource identifier (URI)
    man UTF-8 - an ASCII compatible multibyte Unicode encoding
    man arp - manipulate the system ARP cache
    man boot - System bootup process based on UNIX System V Release 4
    man 7 ip - Linux IPv4 protocol implementation
    man charsets - character set standards and internationalization
    man gittutorial - A tutorial introduction to Git
    man gittutorial-2 - A tutorial introduction to Git: part two
    man gitglossary - A Git Glossary
    man git-commit - Record changes to the repository
    man git-status - Show the working tree status
    man git-add - Add file contents to the index
    man 7 glob - globbing pathnames
    man hier - description of the filesystem hierarchy
    man inode - file inode information
    man 7 time - overview of time and timers
    man tcp - TCP protocol
    man udp - User Datagram Protocol for IPv4
    man 1 printf - format and print data
    man system - execute a shell command
    man for - 'For' loop
    man while - Execute script repeatedly as long as a condition is met
    man if - "use" a Perl module if a condition holds (also can "no" a module)
    man syscalls

    ## C Language
        man ascii    - ASCII character set encoded in octal, decimal, and hexadecimal
        man 3 stdio  - standard input/output library functions
        man 3 string - stpcpy, strcat, strcmp, strcpy, strlen ... - string operations
        man 3 printf - printf, fprintf ... - formatted output conversion
        man 3 scanf  - scanf, fscanf ... - input format conversion
        man 3 gets   - get a string from standard input (DEPRECATED)
            ## Never use this function.
        man 7 standards

## Slackware update
    Select a mirror in /etc/slackpkg/mirrors removing the "#" in the line

    slackpkg update gpg # only once or when change mirror

    slackpkg update
    slackpkg install-new
    slackpkg upgrade-all

## Convert rpm to txz with tags
    rpm2txz -d -c -r program.rpm

## Argumentos em Shell Scripts
    $0 - Identifica o comando emitido
    $@ - O conjunto dos argumentos
    $* - Relação dos argumentos fornecidos
    $# - Número de argumentos fornecidos
    $? - Código de retorno do último comando executado
    $$ - Número (pid) de identificação do processo
    $! - Identificação (pid) do último processo executado em background

    ## Start app and after kill the process
        app &
        PID_APP=$!

        kill -9 $PID_APP

## Run chmod recursively only in directories
    find /path/to/base/dir -type d -exec chmod 744 {} +

## Run chmod recursively only in files
    find /path/to/base/dir -type f -exec chmod 644 {} +

## Reduce all PDF files in the folder, using usual_JBs.sh script
    # All reduce types (1, 2 and 3) with links
    IFS=$(echo -en "\n\b"); for file in $(ls *.pdf); do echo $file; usual_JBs.sh pdf-r $file 4 y; done

    # All reduce types (1, 2 and 3) without links
    IFS=$(echo -en "\n\b"); for file in $(ls *.pdf); do echo $file; usual_JBs.sh pdf-r $file 4 n; done

    # Reduce type 1 with links
    IFS=$(echo -en "\n\b"); for file in $(ls *.pdf); do echo $file; usual_JBs.sh pdf-r $file 1 y; done

    ## Rename the files - remove "_r2ly", "_r3ln" etc
        IFS=$(echo -en "\n\b"); for file in $(ls *pdf); do echo $file; mv "$file" "${file::-9}.pdf"; done

    ## Delete all the "reduce files" generated
        # To see
            ls *_r?l?.pdf
        ## To delete
            rm *_r?l?.pdf

## Manipulação de nomes e caminhos de arquivos
    ## Retorna o último nome após o último /
        basename /usr/local/bin/gzip
            gzip

        basename ver/pdf/file.pdf
            file.pdf

    ## Retorna como resultado o caminho inteiro fornecido
        dirname /usr/local/bin/gzip
            /usr/local/bin

        dirname ver/pdf/file.pdf
            ver/pdf

## Best way to unplug a USB external hard-drive after proper unmounting
    udisks --detach /dev/sdX

## sed add text in begin of file
sed -i '1s/^/task goes here\n/' todo.txt
    ## Or
sed -i '1itask goes here' todo.txt

## sed add ' in the begin
    echo "abc" | sed 's/^/'/'
'abc

## sed add .mp3 in the end
    echo "abc" | sed 's/$/.mp3/'
abc.mp3

## sed duplicate text in a line
    echo "abc d efg" | sed 's/.*/& &/'
abc d efg abc d efg

## Rename a Linux network interface without Udev/Reboot
    ## eth1 to eth0
        ifconfig eth1 down
        ip link set eth1 name eth0
        ifconfig eth0 up

    ## wlan0 to wlan1
        ifconfig wlan1 down
        ip link set wlan1 name wlan0
        ifconfig wlan0 up

## Utilizando caracteres e acentuação da língua portuguesa
#include <locale.h> // Necessário para usar setlocale

int main(){
    setlocale(LC_ALL,""); // Alterando para o padrão do sistema operacional
...
}

## Default 64 bits configure
    ./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc

## Redireciona os erros para erros.txt
    comando 2> erros.txt

## Redireciona a saída padrão para saida.txt
    comando > saida.txt

    comando 1> saida.txt

## Redireciona a saída padrão e os erros para o mesmo arquivo (saida_e_erros.log)
    comando &> saida_e_erros.log

## Suprime a exibição de mensagens de erro. Útil quando as mensagens de erro não nos interessam
    comando 2>&- saida.log

## Envia todas as mensagens de erro para a tela e a saída do comando para o arquivo saida.log
	# Útil em shell scripts quando precisamos enviar os erros para a tela
    comando 2>&1 saida.log

## Enviar a saída e erros para arquivos arquivos diferentes
    comando 1> saida.log 2> erros.log

## Linux BIOS information
    dmidecode

    dmidecode --type bios

    ## Summary
        for i in baseboard-manufacturer system-version system-product-name chassis-type \
        system-serial-number bios-release-date bios-version; do
            echo "$i : $(dmidecode -s $i)"
        done

    ## memory info - RAM info
        # Speed
        dmidecode -t 17

        # Maximum Capacity
        dmidecode -t 16

        # All
        dmidecode -t memory

## Dolphin (re)enable warning message dialog before Empty Trash
    nano ~/.config/kiorc

    ConfirmEmptyTrash=false
        > true

    # Old location
    nano ~/.kde/share/config/kiorc

## ASUS keyboard retro light
    # https://forum.kde.org/viewtopic.php?f=63&t=121045
    ## Load the module (asus-nb-wmi) if not load
        # lsmod | grep "asus"
        echo "modprobe asus-nb-wmi" >> /etc/rc.d/rc.local

    ## With root - VALUE - 0 to 3 (0 off, 3 max)
        echo VALUE > /sys/class/leds/asus\:\:kbd_backlight/brightness

    ## without root - VALUE - 0 to 3 (0 off, 3 max)
        dbus-send --type=method_call --print-reply=literal --system --dest='org.freedesktop.UPower' \
        '/org/freedesktop/UPower/KbdBacklight' 'org.freedesktop.UPower.KbdBacklight.SetBrightness' "int32:VALUE"

        ## Get current brightness
            dbus-send --type=method_call --print-reply=literal --system --dest='org.freedesktop.UPower' \
            '/org/freedesktop/UPower/KbdBacklight' 'org.freedesktop.UPower.KbdBacklight.GetBrightness'

            ## Or
            cat /sys/class/leds/asus\:\:kbd_backlight/brightness

    ## If KDE not "found" the keyboard retro light, "start" UPower
        echo "qdbus --system org.freedesktop.UPower" >> /etc/rc.d/rc.local

        ## And reload the shortcut keys
            System Setting > Shortcuts and Gestures > Global Keyboard Shortcuts
            KDE component: KDE Daemon
            Reset the "Decrease Keyboard Brightness" and "Increase Keyboard Brightness"

## NTFS error
    ## mount exited with exit code 13: $MFTMirr does not match $MFT (record ..
    ## or mount NTFS as only read mode
        ntfsfix /dev/sdXX

## Dolphin freezing when delete file and/or clean the trash (If you use VLC)
    ## 32 bits or distro with work only with /usr/lib/
        /usr/lib/vlc/vlc-cache-gen -f /usr/lib/vlc/plugins

    ## 64 bits
        /usr/lib64/vlc/vlc-cache-gen -f /usr/lib64/vlc/plugins

## Select URL from a text (or html file)
    sed -n 's/.*href="\([^"]*\).*/\1/p'

    grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*"

    grep -o 'http[^"]*'

## How long ago a Linux system was installed? - Day that the system was installed
    ls -alct / | tail -1
    # or
    ls -alct / | tail -1 | awk '{print $6, $7, $8}'

## Count occurrences of a char in a string
    needle=","
    var="text,text,text,text"
    numberOccurrences=$(grep -o "$needle" <<< "$var" | wc -l)

## Shell script read value from pipe
tmpFile=`mktemp` # Temp file if was used a pipe (|)
cat > $tmpFile # Write the pipe content a tmp file

exec </dev/tty >/dev/tty # Set input back to default (keyboard)

sizeTmpFile=`ls -l $tmpFile | cut -d ' ' -f5` # tmpFile size

if [ "$sizeTmpFile" -gt '0' ]; then
    fileName=$tmpFile
else
    fileName=$1
fi

if [ "$fileName" == '' ]; then
    echo "Error - need pass the file name to grep"
else
    #...commands...
fi

# ...

# Don't forget of delete the tmp file
rm $tmpFile # Delete the tmpFile

## sboinstall with pkgtype txz instead tgz (Takes up less disk space)
    PKGTYPE=txz sboinstall -i program

## Audio output in the HDMI
    pavucontrol
        > in the tab "Configuration"
            > in "Profile" Select "HDMI Output"

## Clean-up movie.mkv file (remove name in the tracks and chapters)
    ## Remove the Name of movie, track audio a1, track video a1 and track subtitle s1
        mkvpropedit -e info -s title= -e track:a1 -s name= -e track:v1 -s name= -e track:s1 -s language=en -s name= movie.mkv

    ## Remove chapters
        mkvpropedit --chapters '' movie.mkv

    ## Set language English to track audio a1, video v1, and subtitle s1
        mkvpropedit -e info -s title= -e track:a1 -s name= language=en -e track:v1 -s name= language=en -e track:s1 -s language=en movie.mkv

    ## Set audio (a2) as default (a1 flag-default=0), video (v1) with language jpn, subtitle (s1) with language pt and as default
    mkvpropedit -e track:a1 -s flag-default=0 -e track:a2 -s flag-default=1 -e track:v1 -s language=jpn -e track:s1 -s language=pt -s flag-default=1 movie.mkv

    ## auto with one file mkv in the folder
        i=$(ls *.mkv); mkvpropedit -e info -s title= -e track:a1 -s name= -e track:v1 -s name= -e track:s1 -s language=en -s name= $i

    ## Manual
    https://mkvtoolnix.download/doc/mkvpropedit.html

## Use the Unofficial Bash Strict Mode (Unless You Love Debugging)
    #!/bin/bash
    set -euo pipefail
    IFS=$'\n\t'

    ## Option instructs bash to immediately exit if any command has a non-zero exit status
        set -e

    ## When set, a reference to any variable you haven't previously defined is an error, and causes the program to immediately exit
        set -u

    ## If any command in a pipeline fails, that return code will be used as the return code of the whole pipeline
        # By default, the pipeline's return code is that of the last command - even if it succeeds
        set -o pipefail

    ## link: http://redsymbol.net/articles/unofficial-bash-strict-mode/

## File associations in KDE/Plasma
    KDE stores its mimetype mappings in:
        ~/.local/share/applications/mimeapps.list

    You can also change these associations with the kcmshell4 tool (see also):
        kcmshell4 filetypes

## Senha do Kindle esquecida
    Se você não se lembra da senha do seu Kindle, você precisará redefinir seu dispositivo,
    o que removerá todas as suas informações pessoais e conteúdo baixado

    Qualquer conteúdo que você tenha comprado na Amazon é automaticamente salvo na Nuvem e
    pode ser novamente baixado da aba Tudo ao registrar seu Kindle na sua conta novamente

    ## Para redefinir seu dispositivo:
        Toque no campo de senha para exibir o teclado virtual
        Digite 111222777 e toque em OK. Seu Kindle será reiniciado

## GhostScript - Reduzindo o tamanho de arquivos PDF pelo terminal
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dNOPAUSE -dBATCH -sOutputFile=novo.pdf velho.pdf
    # or
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sOutputFile=novo.pdf velho.pdf

    Onde novo.pdf é o novo arquivo que será criado e velho.pdf é o antigo, o grande
    gs :: Ou GhostScript, um interpretador e visualizador de arquivos PS e PDF
    -sDEVICE :: Determina o dispositivo de saída do comando
                Como estamos gerando um arquivo PDF, usaremos o dispositivo built-in pdfwrite
    -dCompatibilityLevel :: Determina o nível de compatibilidade do PDF
                            Neste caso o level 1.3 é compatível com o Acrobat Reader 3 ou superior
                            Level 1.4 por exemplo já seria compatível apenas com Acrobat Reader 5 ou superior
    -dNOPAUSE :: Desabilita o prompt (pausa) ao final de cada página processada
    -dBATCH :: Processamento em batch. Caso omita esta opção, após o processamento você cairá no interpretador gs
               e precisará digitar "quit" para sair

## Get the users normal users
    cat /etc/passwd | grep -vE "nologin|ftp" | grep home | awk -F':' '{ print $1}'
    # or
    cat /etc/passwd | awk -F: '$3 > 499 {print $1}'
    # or
    awk -F ':' '$3 > 499 {print $1}' /etc/passwd

    # test
    user_normal=`awk -F ':' '$3 > 499 {print $1}' /etc/passwd`
    ls /home/$user_normal

## KDE link open as file:///var/tmp/kdecache...
    Edit in the "System Settings" the "Default Applications" - "Web Browser" and set the path to the browser as "/usr/bin/firefox"

## Rename UPPERCASE to lowercase
    ## Only local folder
        IFS=$(echo -en "\n\b"); for i in $( ls | grep [A-Z] ); do mv -i "$i" `echo "$i" | tr 'A-Z' 'a-z'`; done

    ## Recursive
        IFS=$(echo -en "\n\b"); for i in $( find . | grep [A-Z] ); do mv -i "$i" `echo "$i" | tr 'A-Z' 'a-z'`; done

## Auto-logout do terminal
    TMOUT=300
    # Time in seconds

## Iniciar o Dropbox no KDE com ícone de notificações (system tray icon)
    dbus-launch ../dropboxd

## Clean env | limpar variaveis setadas incialmente no ambiente
    unset $(/usr/bin/env | egrep '^(\w+)=(.*)$' | egrep -vw 'PWD|USER|LANG' | /usr/bin/cut -d= -f1);

    ## or
        unset $(env | grep -o '^[_[:alpha:]][_[:alnum:]]*' | grep -v -E '^PWD$|^USER$|^TERM$|^SSH_.*|^LC_.*')

## Video para mp3
    mplayer -dumpaudio arquivo_video.mp4 -dumpfile arquivo_audio.mp3

## Run "usual_JBs.sh pdf-r file.pdf" for all file in a directory
    IFS=$(echo -en "\n\b"); for file in $(ls -1); do echo "1 $file"; usual_JBs.sh pdf-r "$file" 4; done

## Assinar o PDF - Sign the PDF
    1 Tire uma boa foto da sua assinatura (assine em um papel branco com uma caneta azul ou preta)
    2 Remova o fundo branco da imagem (png e adicione o canal alpha no Gimp)
    3 "Assine o PDF" inserindo a imagem onde deveria assinar utilizando Master PDF Editor (ou outro editor de PDF)
    4 Abra o PDF com a assinatura no Opera (ou outro navegador com suporte) e imprima o arquivo como imagem

## Size of a directory/folder on the command line
    du -sh

    ## Or
        du -sh folder

    # -s, --summarize display only a total for each argument
    # -h, --human-readable print sizes in human readable format (e.g., 1K 234M 2G)

## Combinar dois arquivos de texto em duas colunas "arq1 arq2"
    paste file1.txt file2.txt > fileFinal.txt

## Format USB to FAT 32
    ## Create the partition with the type FAT 32
        # Change sdX to correct drive
        cfdisk /dev/sdX

        ## Or
            fdisk /dev/sdX

    ## Format the new partition to FAT 32
        mkfs.fat -F 32 -I /dev/sdX1

## Run wget with download limit rate
    wget -c link -O filename_save.extension --limit-rate=200000 # (195KB/s)

## wget show website in terminal
    wget -O - slackware.com

## Descobrir a placa-mãe sem programa
    ## Windows - CMD
        wmic baseboard get product,manufacturer

    ## Gnu/Linux - terminal as root
        dmidecode | more

        ## Procure por "Base Board Information"
            digite /Base

## man search
    Use ctrl + f or /
        n - next match or
        shift + n - previous match

## To get an ASCII man page file, without the annoying backspace/underscore attempts at underlining,
    # Weird sequences to do bolding:
    # man comand_to_get | col -b > comand_to_get.txt
    man ksh | col -b > ksh.txt

## Enable ssh X11 on Slackware
    ## The remote server need GUI and that GUI need to be up

    ## To connect
        ssh -X user@ip

    ## Added in /etc/ssh/sshd_config
        X11Forwarding yes

    ## Restart the ssh service
        /etc/rc.d/rc.sshd restart

    ## Exit from this connection

    ## Before connect again, to enable the access to any user to GUI
        xhost +

    ## To connect
        ssh -X user@ip

        ## or
            ssh -Y user@ip

            ssh -Y root@192.168.0.42

    ## To see connections in the Konsole (look to the IP)
        w

    ## To use the display remote
        export DISPLAY=:0.0

    ## To use the display local
        export DISPLAY=ip_local_host:0.0
        export DISPLAY=192.168.0.13:0.0

    ## To test the display
        xclock &

## Access ssh X11 on Windows
    ## Add in the remote server in /etc/ssh/sshd_config # To anothers OS /etc/ssh/sshd_config
        X11Forwarding yes

    ## Download and Install full Xming-fonts and Xming
        https://sourceforge.net/projects/xming/files/?source=navbar

    ## Change the shortcut to start Xming. Right click your mouse to go to properties.
        Add -ac to your XMing shortcut:
        "C:\Program Files\Xming\Xming.exe" :0 -clipboard -multiwindow -ac

    ## Start XMing

    ## Download putty
        http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

    ## Configure putty
        In Session: Add the IP and port to remote server

        In Connection >> SSH >> X11: Mark Enable X11 Forwarding, set the display to: localhost:0
        and protocol to MTI-Magic-Cokie-1

    ## Connect on the putty - export the display
        export DISPLAY=192.168.0.13:0.0

    ## Test the display
        xclock &

## Warning packages removed Slackware
    removepkg *z | grep -E "WARNING|Removing package"

    TMPFILE=`mktemp`; removepkg *z | tee $TMPFILE; echo -e "\n\n\t$TMPFILE\n"; cat $TMPFILE | grep -E "WARNING|Removing package"

    ## Remove the file after?
        rm $TMPFILE

## Searh for a file /var/log/packages/*
    grep "/vlc$" /var/log/packages/*

## Count files in the folder
    countFiles=`ls -la | cat -n | tail -n 1 | awk '{print $1}'`; echo "Count files in this folder: $countFiles"

## Count files of one type in the folder
    fileType=mp3; countFiles=`ls -la *$fileType| cat -n | tail -n 1 | awk '{print $1}'`; echo "Count files in this folder: $countFiles"

## Extract audio from video file and convert to MP3
    ## audio 0
        ffmpeg -i file.mkv -map 0:a:0 audio0.mp3

    ## audio 1
        ffmpeg -i file.mkv -map 0:a:1 audio1.mp3

    ## Check file (convert), set correctly duration
        lame audio0.mp3 audio01.mp3

## Reduce video size
    ffmpeg -i inVideo.mp4 outVideo.mp4

## Convert video
    ffmpeg -i inVideo.avi outVideo.mp4

    ## Convert inVideo.mkv to outVideo.mp4 - with copy of codec
        ffmpeg -i inVideo.mkv -codec copy outVideo.mp4

    ## Convert all file .mp4 to .mkv - with copy of codec
        for file in *.mp4; do ffmpeg -i "$file" -codec copy "${file::-2}kv"; done

## Convert entire playlist from flac, oog, flac to mp3
    ## 320 k
        for f in *.flac , *.m4a , *.ogg ; do ffmpeg -i "$f" -ab 320k "${f%.m4a}.mp3"; done

    ## normal (small files)
        for f in *.flac , *.m4a , *.ogg ; do ffmpeg -i "$f" "${f%.m4a}.mp3"; done

## Convert ogg to mp3 with ffmpeg
    for file in $(ls *.ogg); do echo $file; ffmpeg -i ${file} -acodec libmp3lame ${file::-4}.mp3; done

## Rename several file adding some parte
    # file_output.txt => f; ${f:2} => le_output.txt; ${f::-4} => file_output

    ## Test
        for f in *"(128kbit_AAC).mp3" ; do echo "${f::-18}".mp3; done

    ## Run
        for f in *"(128kbit_AAC).mp3" ; do mv "$f" "${f::-18}".mp3; done

## Remove part of the name of files
    ## To remove extra.test
        rename "extra.test" "" *

## pdf to txt - need poppler package
    pdftotext input.pdf output.txt

    ## Or with -layout to keep the layout
        pdftotext -layout input.pdf output.txt

## sed - delete/remove and replace values
    ## Replace/remove multiple empty line with one empty line
        sed '/^$/N;/^\n$/D' inputfile

    ## Remove all empty lines
        sed -r '/^\s*$/d' inputfile

    ## Delete empty lines
        sed '/^$/d' file

    ## Delete lines by line number
        echo -e "a\nb\nc\nd\ne" | sed -e{1,3}d

    ## Change value for new line
        sed 's/value/\n---\n/g'

    ## Remove the last n lines of a file - Print with the last 4 lines
        #Need the - in > head -n -
        head -n -4 file.txt

    ## Remove new line (\n) for one space
        echo -e "\n\n\noi\n\n\ncomo\n\n\nv\nai" | sed ':a;N;$!ba;s/\n/ /g'
        # or
        tr '\r\n' ' '

    ## Remove new line (\n)
        echo -e "\n\n\noi\n\n\ncomo\n\n\nv\nai" | sed ':a;N;$!ba;s/\n//g'

        ## Or
            tr -d '\n'

    ## sed change value (TV) to (tv)
        echo "TV" | sed 's/TV/tv/g'

    ## sed "grep" number
        echo "awsafd 1.2.4" | sed 's/[^0-9]*//g'

    ## sed "grep" number and dot
        echo "awsafd 1.2.4" | sed 's/[^0-9,.]*//g'

    ## sed troca \n por nova linha
        sed 's/\\n/\n/g'

    ## RedShift GUI Error
        sed -i 's/|/,/g' ~/.redshiftgrc

    ## Remove all possible spaces at the end of the line
        sed 's/ *$//' file

        ## To write in the same file
            sed -i 's/ *$//' file

    ## Using the [:blank:] class you are removing spaces and tabs
        sed 's/[[:blank:]]*$//' file

    ## Removing all spaces
        sed 's/ //g' file > file2.txt

    ## Remove spaces in the end of line
        sed 's/\s*$//' file > file2.txt

## Remove '\r' (return)
    ## Useful in subtitles or text files to use with grep
    tr -d '\r'

    sed 's/\r$//' file

    # grep ^1$ sub.srt

## String cut
    ## Print first 5 characters
        echo -e "Hello_World" | cut -c1-5

    ## Print the first 3 characters
        echo -e "Hello_World" | cut -c-3

    ## Print the 3 characters to end
        echo -e "Hello_World" | cut -c3-

    ## Print the 1 field and the 7 based on the delimiter
        echo " root:x:0:0:root:/root:/bin/bash" | cut -d: -f1,7

        cut -d ';' -f2 tabela.txt
        # -d delimiter
        # -fX number X of the desired column

    ## Cut file after on char
        echo "te.st 1.23" | cut -d '.' -f2

    ## until the end
        echo "te.st 1.23" | cut -d '.' -f2-

    ## cut file name by extension
        echo "file_name.txt" | cut -d '.' -f1

        echo "file.name.2.txt" | rev | cut -d '.' -f2- | rev

## Change the default shell in Linux/Unix/MacOS?
    ## chsh -s shell-path user
    chsh -s /bin/bash j

    ## Logout to test

## Print only some lines
    b=3; f=18; cat -n file.txt | sed -n -e "$b,$f p" -e "$f q"

    ## Or
        b=3; f=18; sed -n "$b, $f p" file.txt

## Localize arquivos grandes
    find . -size +1000M

    # b - blocos de 512-byte (este é o default, se não for utilizado nenhum sufixo)
    # c - bytes
    # w - palavras de dois bytes
    # k - Kilobytes (unidades de 1024 bytes)
    # M - Megabytes (unidades de 1048576 bytes)
    # G - Gigabytes (unidades de 1073741824 bytes)

## Reset directories and files permission
    ## Set all folder to permission 755
        find . -type d -exec chmod 0755 {} \;

    ## Remove execute permission from files without touching folders
        find . -type f -exec chmod 0644 {} \;

        ## Or
        find . -type f -exec chmod 0644 {} +

    ## Remove permission from other users, also permission to execute from current user
        find . -type f -exec chmod 0600 {} \;

    ## Change owner user to root
        chown root -R *

    ## Change files group to root
        chgrp root -R *

## Expansão de urls encurtadas com curl
    curl -sIL short-url | grep ^Location;

    curl -sIL http://goo.gl/CwbmNk | grep ^Location;
    # Location: http://www.shellhacks.com/en/HowTo-Extract-Archives-targzbz2rarzip7ztbz2tgzZ

## How to compare the content of two or more directories
    diff -qr dir1/ dir2/

    # -q, report only when files differ
    # -s, report when two files are the same
    # -r, recursively compare any sub directories found

## Extract the file name from a URL
    url=http://pics.sitename.com/images/191211/mxKL17DdgUhcr.jpg
    filename=$(basename "$url")
    echo "file name: $filename"

## LiLo login/command boot without password
    <label> single init=/bin/<shell>

    <label> init=/bin/<shell>
        ## remount rw, update passwd and remount ro

    ## Set the new password
        passwd

    ## Examples
        linux single init=/bin/sh

        linux init=/bin/sh

        ## Slackware
            Slackware single init=/bin/bash rw

        ## or
            Slackware init=/bin/bash
                # System with minimal services and it is mounted read only

            mount -o remount,rw /

            passwd

            ## Be sure to finally remount your / as ro or something might screw up
            mount -o remount,ro /

## Grub login/command boot without password
    ## In the Grub menu, select the entry and press "e" to edit

    ## Appending in the line "linux ....", after boot it with "Ctrl-x" of "F10"
        rw init=/bin/bash

    ## Set the new password
        passwd

## Show the Grub menu
    nano /etc/default/grub

    ## Comment the line
        #GRUB_HIDDEN_TIMEOUT=0

        ## OR
        #GRUB_TIMEOUT_STYLE=hidden

        GRUB_TIMEOUT_STYLE=menu

    ## Set to false
        GRUB_HIDDEN_TIMEOUT_QUIET=false

    ## Update
        update-grub

## Remove Spotify pop-up notification when a song starts
    ## Exit Spotify

    ## Then edit
        ~/.config/spotify/Users/[Spotify user name]-user/prefs

    ## And set
    ui.track_notifications_enabled=false

## Gmail list the archived emails
    # https://support.google.com/mail/answer/7190
    has:nouserlabels -in:Sent -in:Chat -in:Draft -in:Inbox

    # Mais que 10m e mais de 1 ano
    larger:10m older_than:1y

## Change size monitor
    xrandr --output LVDS1 --mode 1024x768
    xrandr --output LVDS1 --mode 1366x768

    xrandr -s 1024x768
    xrandr -s 1366x768

    ## Add
        xrandr --output LVDS1 --mode 1024x768
        xrandr --output VGA1 --mode 1024x768
        xrandr --output LVDS1 --off
        xrandr --output VGA1 --mode 1440x900

    ## Remove
        xrandr --output VGA1 --mode 1024x768
        xrandr --output LVDS1 --mode 1024x768
        xrandr --output VGA1 --off
        xrandr --output LVDS1 --mode 1366x768

## Comprimir zip em várias partes
    7z a -v512m Large-file-separated-in-multi-parts.zip Large-Gigabytes-File.SQL

    # Large-file-separated-in-multi-parts.zip.001, Large-file-separated-in-multi-parts.zip.002,
    # Large-file-separated-in-multi-parts.zip.003, Large-file-separated-in-multi-parts.004 etc

## Smarty DNS
    http://www.smartydns.com/
    # trial 14 days

    192.241.143.47
    87.117.205.40
    37.139.11.137

    https://unlocator.com/
    # trial 7 days

    185.37.37.37
    185.37.37.185
    185.037.037.037
    185.037.037.185

## DNS Cloudflare
    # https://1.1.1.1/
    1.1.1.1

## Open DNS
    # https://www.gigadns.com.br/
    ## IPv4:
        189.38.95.95
        189.38.95.96

    ## IPv6:
        2804:10:10::10
        2804:10:10::20

## Magic SysRq key
    # Enable? 1 - Yes, 0 - No
    cat /proc/sys/kernel/sysrq

    # To enable
    echo 1 > /proc/sys/kernel/sysrq

    # Keys
    un"R"aw take control of keyboard back from X,
    t"E"rminate send SIGTERM to all processes, allowing them to terminate gracefully,
    k"I"ll send SIGKILL to all processes, forcing them to terminate immediately,
    "S"ync flush data to disk,
    "U"nmount remount all filesystems read-only,
    re"B"oot

    "Raising Elephants Is So Utterly Boring", "Reboot Even If System Utterly Broken"
    or simply the word "BUSIER" read backwards

## Conversão de fim de linha entre sistemas operacionais (*nix e Windows)
    # Nos sistemas *nix, o fim de linha é assinalado pelo caracter line feed,
    # logo não existe um posicionamento na primeira coluna da próxima linha.
    # Nos sistemas Windows temos um caractere adicional no fim da linha (carriage return),
    # que precisa ser removido

    # DOS para Unix
    recode dos/CR-LF..l1 arquivo.txt
    # Unix para Windows
    recode l1..windows-1250
    # Unix para DOS
    recode l1..dos/CR-LF

    # Para simplificar, aliases:
    alias dos2unix='recode dos/CR-LF..l1'
    alias unix2win='recode l1..windows-1250'
    alias unix2dos='recode l1..dos/CR-LF'

## Busca em vários arquivos de texto
    # Finding all files containing a text string on Linux
    # use -w to stands match the whole word
    grep -rn 'directory~$PWD' -e "pattern"

    # -r or -R is recursive, -n is line number and -w stands match the whole word.
    # -l (letter L) can be added to have just the file name.
    # Along with these, --exclude or --include parameter could be used for efficient searching. Something like below:
    grep --include=\*.{c,h} -rnw 'directory' -e "pattern"
    # This will only search through the files which have .c or .h extensions. Similarly a sample use of --exclude:
    grep --exclude=*.o -rnw 'directory' -e "pattern"
    # Above will exclude searching all the files ending with .o extension.
    # Just like exclude file its possible to exclude/include directories
    # through --exclude-dir and --include-dir parameter, the following shows how to integrate --exclude-dir:
    grep --exclude-dir={dir1,dir2,*.dst} -rnw 'directory' -e "pattern"
    # This works for me very well, to achieve almost the same purpose like yours.
    # For more options : man grep

    grep -rn $PWD -e "24" > ../../../a.txt

## KDE - Minimize/Maximize Keyboard Shortcut
    Alt+F2 and type "systemsettings"
    then click on "Shortcuts and Gestures".
    The window management shortcuts are under "Global Keyboard shortcuts", then select "Kwin" from the drop-down menu.
    By default maximise is Alt+F11 and minimise is Alt+F10.

    You could set the keyboard shortcuts to the "Quick title" to move left/right etc

## Firefox Special Paste
    Use the shortcut Ctrl + Shift + V.

    # If you happen to have the Adblock Plus add-on installed it might have overridden it with displaying
    # the "Blockable Items on current page" sidebar.
    # In this case enter "about:config" in your address bar, then search for the key
    # "extensions.adblockplus.sidebar_key", remove the CTRL+SHIFT+V association and restart the browser.

## How can I suspend/hibernate from command line?
    ## To get Hibernation
        su - root -c 'pm-hibernate'

    ## To get Suspend
        su - root -c 'pm-suspend'

## Google Slides
    ## Change the size off slide
        Click the File "menu" and select "Page setup"
        Select a size from the drop down menu:
        Custom -> pixels: 1024 x 788

    ## Reapply master slide theme to all slides
        Set layout to slides
        If some not applay, select the text box in te slide and go to Format > Clear Formatting

## VLC continue playback?
    interface> Main interfaces> QT:"Continue playback?" ask -> never

## VLC unique instance in the KDE menu
    /usr/bin/vlc --started-from-file %U

## VLC with sound only in of the effects
    Audio > Stereo mode
        > Original # (Surround)
            > Stereo

    ## Change default Audio - Stereo Mode setting to Stereo
        Tools > Preferences
            > Show settings > All

            > Audio
                Stereo audio output mode
                    > Unset
                        > Stereo

## Mesclando linhas de arquivos
$ cat arq1.txt
1
2

$ cat arq2.txt
a
b

$ paste -d '\n' arq1.txt arq2.txt
1
a
2
b

    # A diretiva '\n' indica o delimitador a ser usado para concatenar o conteúdo dos arquivos.
    # Nesse caso, foi utilizado a quebra de linha ('\n').

    # O comportamento padrão do comando paste é colocar as linhas dos arquivos separadas por tabulações:
$ paste arq1.txt arq2.txt
1       a
2       b

    # Nos exemplos utilizamos apenas dois arquivos, mas na prática podemos usar mais arquivos

## Star Wars em bash at the terminal
    telnet towel.blinkenlights.nl

## Gost in the Shell at the terminal
    ssh ghost@theshell.xyz

## Ip externo pelo terminal
    wget -qO - icanhazip.com

 ## Popcorn-Time error, not found lib libudev.so.1
    ln -s /usr/lib64/libudev.so /usr/lib64/libudev.so.1

## Scan de rede sem fio / Wi-Fi
    iw dev wlan0 scan

    # iwlist is seriously deprecated. Remove it from your system and never use it again.
    # Do the same with iwconfig, iwspy. Those tools are ancient and were designed in an era where 802.11n didn't exist.
    # Kernel developers maintain a ugly compatibility layer to still support wireless-tools,
    # and this compatibility layer often lies.

## grep com mais de um valor
    cat file.txt | grep -E "Cell|Encryption|Quality|Last beacon|ESSID"
    # grep -E é o mesmo que egrep, aceita "A|B" e 'A|B'

## Saída de um processo para outro
    # tee >(proc1) >(proc2) >(proc3) | proc4
    iw dev wlan0 scan | grep "SSID" | nl
    iw dev wlan0 scan | grep -E "SSID:|signal:|beacon interval:|WPA|last seen:" | tee /dev/tty | grep -E "SSID" | wc -l

## Ver tamanho do pacote de rede
    netstat -i <interface>
    ifconfig <interface>

## Clonar pasta de um site ou baixar o conteúdo de pasta em um site
    lftp -c 'open link ; mirror -c -e folder'

    lftp -c 'open http://slackware.com/~alien/multilib/ ; mirror -c -e 14.1'

    lftp -c 'open http://sumo.dlr.de/trac.wsgi/browser/trunk/sumo/tests/complex/tutorial/ ; mirror -c -e hello'

    lftp -c 'open http://slackware.uk/people/alien/slackbuilds/vlc/ ; mirror -c -e build/'

## Informações do IP externo
    http://ip-lookup.net/

## Screenshot de 5 em 5 segundo no terminal
    count=0; while true; do ((count++)); import -window root -display :0 screen.$count.jpg; sleep 5; done

## shellscript quantidade de parâmentros
    Quantidade de parâmetros -> $# -> echo $#
    caminho com \ , add "" -> "var"

## backup do Grub (MBR) e restaurar
    dd if=/dev/sdc of=mbr.img count=1 bs=512

    ## Restaurar o Grub (MBR)
    dd of=/dev/sdc if=mbr.img
    # Use um live cd do Linux e o mbr.img que fez backup

## Senha aleatórias
    date +%s | md5sum | base64 | head -c 10 ; echo

## Pasta de review ou annotations do okular
    ~/.kde/share/apps/okular/docdata/

## Find only local folder
    find /dev -maxdepth 1 -name 'abc-*'

## xargs - create a line of arguments to another command
    ## If no command is passed, will use echo, the default command
        echo 1 2 3 4 | xargs

    ## Create file from a fileListNames.r
        cat fileListNames.r | xargs touch

    ## Delete file with "*.tmp" in the folder /tmp
        find /tmp -name “*.tmp” | xargs rm -rf

    ## Change the permission of file with start with ar*
        ls -1 ar* | xargs -n 1 chmod 775

    ## Create md5sum of all files in on folder and sub directories
        ## find "-print0" and xargs "-0" to work with files with space
        find folder/ -type f -print0 | xargs -0 md5sum > result.md5

    ## Break the parameters input in 2 by time
        echo {0..9} | xargs -n 2

    ## Run one command for each line of result
        find . | grep ".*.ini" | xargs -L 1 git diff

## Listagem ls normal > 1 2 3 4 5 6 8 9 10 11 12 13 ...
    ls -v

## lcd, mover e listar diretório
    function changeDirectory {
        cd $1 ; ls -l -a -v -h --color
    }
    alias lcd=changeDirectory

    ## Or
        alias lcd="cd $1 ; ls -l -a -v -h --color"

## Opções úteis do ls
    ls -lSrh
    ls -lXrh

    -l :: fornece saída detalhada
    -S :: coloca em ordem de tamanho
    -r :: inverte a listagem colocando por último os maiores arquivos
    -h :: fornece na saída um valor melhor para ser lido por humanos
    -X :: ordenar em ordem alfabética

## Ver maiores diretórios
    du -h | egrep -v "\./.+/" | sort -h

    du: -h :: fornece na saída um valor melhor para ser lido por humanos
    egrep: -v :: inverte o filtro, buscando por ocorrências que não possuam a expressão
    sort: -h :: compara valor melhores no modo humano

## Ignorar o ping no Gnu/Linux
    sysctl -w net.ipv4.icmp_echo_ignore_all=1

    ## Religar
        sysctl -w net.ipv4.icmp_echo_ignore_all=0

    ## Limitar respostas
        sysctl -w net.ipv4.icmp_echoreply_rate=10

## Teste MTU size and MTU Path. Executa ping com pacote de 1500 bytes e não aceita fragmentação (- M do)
    # Apenas root consegue definar o tamanho do ping (-s)
    ping -c 3 -s 1500 -M do google.com

    # Equivalante em Windows:
    ping -l 1500 -f google.com

## Display route - root
    route

## Traceroute
    traceroute google.com

## DNS lookup
    nslookup google.com

    nslookup facebook.com 8.8.8.8

## DNS Server IP address in use
    cat /etc/resolv.conf

    grep "nameserver" /etc/resolv.conf

    nmcli dev show | grep 'DNS'

## Translate domain name to IP
    dig stackoverflow.com

    dig +short stackoverflow.com

    host stackoverflow.com

    nslookup stackoverflow.com

## Copy
    #! / bin/bash # juntar / bin
    export LD_LIBRARY_PATH=".";
    cd /media/sda4/prog/copy/x86_64/
    ./CopyAgent

## Vmware start kernel service
    kdesu /usr/bin/svmware_auto.sh; /usr/bin/vmware %F

## Verificar disco rígido
    # Se a partição for ext4, -f força o teste mesmo que os files clean
    fsck.ext4 -f /dev/sda5

    # Link: http://apoie.org/JulioNeves/index.html (cadeias)

## Criar várias pastas
    mkdir {1..25}

    ## Or
    mkdir folder_{1..25}

## Para remover várias pastas
    rm -r {1..25}

    ## Or
    rm -r folder_{1..25}

## Setar PATH
    export PATH=$PATH:/path/to/dir

    ## Ex Java:
    export PATH=$PATH:/usr/lib64/java/bin:/usr/lib64/java/jre/bin:

## Swap em arquivo
    # Se a máquina tem até 2GB de RAM, coloque o dobro.
    # A partir daí, cada GB adicional de RAM é apenas RAM+2GB na swap.
    Vendo através do sistema de arquivos proc:
    cat /proc/swaps ou swapon -s

    # Criar arquivo para swap
    dd if=/dev/zero of=/dir/swapfile.img bs=1M count=200

    # Crie a área de swap no arquivo:
    mkswap /dir/swapfile.img

    # Ativar o swap
    swapon /dir/swapfile.img
        # *inserir no boot

    ## Resumo final -> 8 GiB
    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=8192
    mkswap /home/j/swapfile.img
    nano /etc/fstab
    /home/j/swapfile.img swap swap default 0 0

    # Se apresener "erro" de permissões de acesso
    chmod 600 swapfile.img

    # Ver valor de swappiness atual
    cat /proc/sys/vm/swappiness

    # To temporarily set the swappiness value:
    sysctl -w vm.swappiness=10

    # To set the swappiness value permanently, edit a sysctl configuration file
    nano /etc/sysctl.conf
    adicionar no arquivo -> vm.swappiness=10
    carregar o configuração padrão/permanente
    sysctl –p

## GNU/Linux change keyboard layout
    https://docs.slackware.com/howtos:window_managers:keyboard_layout

    ## Load the keyboard map. More maps are in /usr/share/kbd/keymaps/
    ## /usr/share/kbd/keymaps/i386/qwerty/br-abnt2.map.gz

    ## Console
        loadkeys br-abnt2

        ## or
            loadkeys us-acentos

            loadkeys br-abnt

    ## X
        setxkbmap -model abnt2 -layout br -variant abnt2

        ## or
            setxkbmap -model abnt2 -layout br

            setxkbmap -model thinkpad60 -layout br

## Mover para pastas
    i=1; while [ $i -lt 25 ]; do mv *S02E$i* $i; i=$((i+1)); done

    # or
    i=1; while [ $i -lt 25 ]; do mv $i.* $i; i=$((i+1)); done

## Renomear arquivos
    ## >> *$igual0$i*.$extensao == *S01E0(i)*.srt
    i=1
    igual=S01E
    extensao=srt
    while [ $i -lt 25 ]; do
        if [ $i -lt 10 ]; then
            mv *$igual"0"$i*.$extensao $i.$extensao
        else
            mv *$igual$i*.$extensao $i.$extensao
        fi
        i=$((i+1))
    done

## Zipar vários arquivos
    i=1; while [ $i -lt 50 ]; do zip -r $i.zip $i; i=$((i+1)); done

## Ver codificação de um arquivo
    file --mime-encoding nome_do_arquivo

## Selecionar e renomear vários arquivos, copiando para outra pasta
    i=1;for arq in hone/l/imagem/*/* ; do cp $arq a/$i.jpg; i=$(($i+1)); done

## Converter UTF-8 para ISO-8859-1
    iconv -f codificacao_de_origem -t codificacao_de_saida arquivo
    iconv -f utf-8 -t iso-8859-1 arquivo

    ## Converter ISO-8859-1 para UTF-8
    iconv -f iso-8859-1 -t utf-8 arquivo

    ## Necessário redirecionar a saída de arquivo para algum lugar
    iconv -f utf-8 -t iso-8859-1 arquivo > novo_arquivo

## Combine PDF / Merge PDF
    https://gitlab.com/pdftk-java/pdftk

    pdftk arq1.pdf arq2.pdf cat output arq1_2.pdf

    java -jar pdftk-all-v3.3.3.jar arq1.pdf arq2.pdf cat output arq1_2.pdf

    ## Split PDF
        pdftk foo-bar.pdf cat 1-12 output foo.pdf

        pdftk foo-bar.pdf cat 13-end output bar.pdf

    ## To remove page 13
        pdftk in.pdf cat 1-12 14-end output out.pdf

## OWNER PASSWORD REQUIRED - Aquivo criptografado/com senha
    # Se conseguir ler ele no leitor de pdf ele tem como senha espaço branco setado
    # qpdf --password=YOURPASSWORD-HERE --decrypt input.pdf output.pdf
    qpdf --password= --decrypt pretextual.pdf pretextual2.pdf

## Contar caracteres
    wc -m

## Evince with not icons
    Criar o arquivo em ~/.config/gtk-3.0/settings.ini
    e no arquivo:

[Settings]
gtk-theme-name = Adwaita
gtk-fallback-icon-theme = gnome

## OMNeT++ estilo bonito # não utilize o tema oxygen default, use oxygen cold
    Criar o arquivo em ~/.config/gtk-3.0/settings.ini
    e no arquivo:

[Settings]
gtk-theme-name = oxygen-gtk
gtk-fallback-icon-theme = gnome

## OSD Lyrics sem ícones
    gtk-update-icon-cache /usr/share/icons/hicolor

## Trocar nome dos arquivo de iso88591 para utf8
    # Apenas testa
    convmv -f iso88591 -t utf8 -r nome_pasta

    ## Troca realmente
    convmv -f iso88591 -t utf8 -r nome_pasta --notest

    # -f : diz qual que é a codificação que o arquivo está no momento (from)
    # -t : diz qual é a codificação que o arquivo deverá ficar (to)
    # -r : usada para alterar a codificação dos arquivos de dentro da pasta, recursivamente.
    # Se você for alterar apenas o nome da pasta ou de um arquivo, retire essa opção.
    # nome_pasta : o nome da pasta ou arquivo cuja codificação será alterada.
    # O comando anterior apenas simulará o resultado da codificação e exibirá na tela.
    # Caso esteja tudo correto, então aplique os resultados rodando o comando novamente,
    # acrescido da opção --notest (são dois traços)

## Criando uma imagem ISO
    # O mkisofs permite criar imagens ISO a partir de um diretório no HD. O “mk” vem de make,
    # ou seja, criar. O “iso” vem de imagem ISO, enquanto o “fs” vem de sistemas de arquivos
    # Ou seja, o nome mkisofs descreve bem o uso do programa, que é criar sistemas de arquivo ISO

    mkisofs -pad -r -J -o nome_do_arquivo.iso /diretorio_de_origem/

    # mkisofs : é o comando que chama o programa
    # -r : permite que qualquer cliente possa ler o conteúdo do arquivo
    #    Evita problemas ao tentar ler o arquivo no Windows
    # -J : Mais uma opção para manter compatibilidade como Windows. Ativa as extensões Joilet
    # -o : Especifica o nome do arquivo ISO que será criado
    # -R é o protocolo para o tipo de extensão Rock Ridge, comumente usado no Linux
    # -l permite mais de 31 caracteres para o nome do arquivo, pode ser que o MS-DOS
    #    não consiga enxergar estes caracteres, já que ele trabalha com um protocolo 8.3;
    # -V especifica uma identificação para o CD (rótulo);
    # -v caso seja esta opção acionada, serão exibidas em seu vídeo todas informações que saírem do mkisofs
    # nome_do_arquivo.iso : O nome do arquivo propriamente dito. Não se esqueça de sempre incluir a extensão .iso
    # O arquivo é sempre gravado no diretório corrente
    # -pad este parâmetro é necessário em muitos OSs, inclusive no Linux,
    #    ele é acionado para evitar erros de entrada e saída
    # /diretório_de_origem/ : O diretório onde estão os arquivos que serão incluídos na imagem
    #    É possível especificar vários diretórios separados por espaços, como em:
    #  /home/ecouto/testes/ /home/ecouto/arquivos/

## Mplayer e suas loucuras! imagem da webcam com efeito MATRIX
    # Em uma linha apenas
    mplayer -fps 30 -vo matrixview -cache 128 -framedrop -vo matrixview driver=v412:width=640:height=480:device= /dev/video0 tv://

## Apagar os arquivos definitivamente e/ou sobrescrever
    shred -n 3 -z file.txt

    Onde:
        -n 3 - número de interações ou gravações;
        -z - significa que o último padrão a ser gravado será zero

    ## shred recursivamente
        find <dir> -type f -exec shred -n 20 -z {} \;

        find <dir> -type f -exec shred -z {} \;

## Personalizando o terminal bash do Linux
    # opções disponíveis no PS1, aplicar no script em shell no seu local ($HOME/.bashrc e /root.bashrc)

    # $PS1 é o prompt de comando
    # $PS2 é solicitado quando um comando exige mais de uma linha
    # Algumas opções do PS1
    # \W: Exibe o nome do diretório (apenas o nome)
    # \w: Exibe o nome do diretório (caminho completo)
    # \d: Exibe a data
    # \s: Exibe o nome do shell
    # \h: Exibe o nome da máquina (hostname)
    # \u: Exibe o nome do usuário
    # \t: Exibe a hora
    # O meu script shell que uso é esse: .bashrc

# Tput setaf * colors => 0 black, 1 red, 2 green, 3 yellow, 4 blue, 5 magenta, 6 cyan, 7 white
if [ $(id -u) -eq 0 ]; then # User root
    PS1="\\[$(tput setaf 3)\\][\\u@\\h:\\w]# " # With color
    #PS1="\\[\\][\\u@\\h:\\w]# "               # Without color
else # "Normal" User
    PS1="\\[$(tput setaf 2)\\][\\u@\\h:\\w]$ " # With color
    #PS1="\\[\\][\\u@\\h:\\w]$ "               # Without color
fi

## make install in one specific folder
    folderInstall=/full/path/folder
    make DESTDIR=$folderInstall install

    ## Or
        make DESTDIR=b/ install

    mkdir aaaa/
    make DESTDIR=$PWD/aaaa/ install

## Add plugins
    ln -s /usr/lib64/mozilla/plugins/ /home/j/.mozilla/

## Alterar brilho terminal
    cat /sys/class/backlight/acpi_video0/brightness
    echo 100 > /sys/class/backlight/acpi_video0/brightness

## Deslogar do skype ou logout skype
    Abri uma janela de um amigo qualquer e enviar /remotelogout

## Recuperar arquivos (ext?)
    extundelete /dev/sdXX --restore-file /pasta/arquivo

    ## Recuperar diretório
    extundelete /dev/sdbXX --restore-directory /caminho/pasta

    ## Todos
    extundelete /dev/sdXX --restore-all

    # link: http://mapburghardt.blogspot.com.br/2012/05/recuperar-arquivos-deletados-em-ext4.html

## KDE tags
    %f - um nome de arquivo único
    %F - uma lista de arquivos; use nos aplicativos que podem abrir vários arquivos locais de uma vez
    %u - um único URL
    %U - uma lista de URLs
    %d - a pasta do arquivo a abrir
    %D - uma lista de pastas
    %i - o ícone
    %m - o mini-ícone
    %c - o título

    ## Ex: ’firefox’ inicie a sua navegação Web em ’www.kde.org’
    ## em vez do firefox, use firefox %u www.kde.org.

## gerar iso - (cdrkit)
    genisoimage -o file_output.iso floder_input/

## bc casas decimais
    echo "scale=2; 10/3" | bc
    scale=> quantas casas decimais.

    ## No bash
    # redirecionamento de entrada inline (<<) proxima palavra delimitador (comum EOF)
    c=`bc << EOF
    scale=2
    d=2
    e=(d + 2)
    f=(d + e)
    f+e
    EOF
    `; echo $c ##não esquecer da crase

    # Em script
    d=2
    c=`bc << EOF
    /*Comentário*/
    scale=2
    e=($d * 2)
    f=($d / 3)
    f+e /*Resultado desejado - nesse caso 10*/
    EOF
    ` # não esquecer de colocar a crase final
    echo $c

## Trocar caracteres em uma string
    echo "Olá.como.vai" | tr "." " "
    # resultado: Olá como vai

## Remover caracteres de uma string
    echo "Olá.como.vai" | tr -d "."
    # resultado: Olácomovai

## Usando select
    #!/bin/sh
    echo "Qual é o seu SO preferido ?"
    select var in "Linux" "Gnu Hurd" "Free BSD" "Other"; do
    break
    done
    echo "Você selecionou $var"

## Convert image in PDF
    convert *.jpg output.pdf

    ## Parameters
        -verbose
        -quality 100
        -density 300
        -sharpen 0x1.0

    ## Best in my test
        convert *.jpg -sharpen 0x1 output.pdf

    ## Convert all image *.jpg to pdf
        IFS=$(echo -en "\n\b"); for f in *.jpg; do echo "$f"; convert $f -sharpen 0x1 ${f::-4}.pdf; done

## Convert PDF in image
    convert input.pdf output.jpg

## Download sites
    wget -c -r -erobots=off -A ".jpg .png" #link_do_site#

## Mount NTFS partition
    mount -t ntfs-3g /dev/sdb1 /mnt/ntfs/

## See partition types
    fdisk -l

## Teste Capture som
    arecord | aplay

## Acertar data/tempo/hora
    ntpdate -u -b ntp1.ptb.de

    ## or
        ntpdate -u -b bonehed.lcs.mit.edu
        ntpdate -u -b ntp.usp.br

## Comentário shell script várias linhas
    : '
    Linha1 comentada
    Linha2 comentada
    Linha3 comentada
    '

    ## or
        # com um delimitador
        :<< 'asd'
        Linha1 comentada
        Linha2 comentada
        Linha3 comentada
        asd

## Boot ValkyrieOS -> baseado no Slackware 14.1
    huge.s intel_pstate=disable

## Open terminal nautilus
    apt-get install nautilus-open-terminal
    nautilus -q

## How to force Dolphin to not execute executable files
    ## Edit /usr/share/mime/packages/freedesktop.org.xml
    ## and find the line that starts the shellscript section:
        <mime-type type="application/x-shellscript">

        ## Then scroll down to find this line within that section:
            <sub-class-of type="application/x-executable"/>

        ## Then comment it out like so:
            <!-- <sub-class-of type="application/x-executable"/> -->

    ## Save that, then compile it with this command:
        update-mime-database /usr/share/mime

        ## If unknown (Unknown media type in type ...)
            rm /usr/share/mime/packages/kde.xml
            update-mime-database /usr/share/mime

## Saber quando o Gnu/Linux foi instalado
    ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'

## Redimensionar Imagens # Pacote Imagemagick
    # Sem modificar aspeto
    mogrify -resize 320x240 *.png

    # Modificar a relação de aspeto, se necessário
    mogrify -resize 320x240! foto.png

    # Redimensionar foto.png para 50% do ficheiro original e manter a relação de aspeto
    mogrify -resize 50% foto.png

    # Modificar apenas a largura da foto.png para 320 e manter a relação de aspeto
    mogrify -resize 240 foto.png

    # Modificar apenas a altura da foto.png para 320 e manter a relação de aspeto
    mogrify -resize x320 foto.png

## Netbeans em Português
    ./netbeans --locale pt:BR

## How to install fonts in Slackware
    # move your fonts (*.ttf) to “/usr/share/fonts/TTF”
    # run those commands in “/usr/share/fonts” - root
    mkfontscale
    mkfontdir
    fc-cache -f -v

## Enable root Ubuntu
    sudo passwd root

## Mysql no Slackware
    https://docs.slackware.com/pt-br:howtos:databases:install_mysql_on_slackware

    ## Para instalar a base de dados
        mysql_install_db

        # or
        mysql_install_db --user=mysql

    ## Necessário mudar as permissões do diretório inicial e assim o sock será gerado
        chown -R mysql.mysql /var/lib/mysql

    ## Para iniciar o MySQL
        mysqld_safe &

    ## Para definir a senha de root/administrador dos bancos de dados
        mysqladmin -u root password <escolha uma senha>

    ## Logando no MySQL com senha
        mysql -u root -p

    ## Logando se não definir senha para root (por padrão é em branco)
        mysql -u root -p

    ## Apache + PHP = em /etc/httpd/httpd.conf descomente a linha
        # Include /etc/apache/mod_php.conf

    ## Inicie o seu Apache
        /usr/sbin/apachectl start

    ## Teste
        touch /var/www/htdocs/infophp.php
        echo "<?php phpinfo(); ?>" > /var/www/htdocs/infophp.php

    ## URL:
        http://localhost/infophp.php

    ## Mysql change port
        ## Inicie o mysql e seus bancos, se ainda não tiver feito
            mysql_install_db --user=mysql

        ## Comente a linha do script /etc/rc.d/rc.mysqld
            SKIP="--skip-networking"

        ## Edite o arquivo /etc/my.cnf e adicione
            port=3306

        # => 7777 no meu teste, ou a porta que quiser.

        ## Inicie o mysql
            bash /etc/rc.d/rc.mysqld start

        ## => Verificando
            ## Conecte com o banco
                mysql -u root

            ## Verificar se skip-networking está off
                MariaDB [(none)]> SHOW VARIABLES LIKE 'skip_networking';

                +-----------------+-------+
                | Variable_name   | Value |
                +-----------------+-------+
                | skip_networking | OFF   |
                +-----------------+-------+

            ## Verifique se a porta foi definida corretamente
                MariaDB [(none)]> SHOW GLOBAL VARIABLES LIKE 'PORT';

                +---------------+-------+
                | Variable_name | Value |
                +---------------+-------+
                | port          | 7777  |
                +---------------+-------+

## Print network connections
    netstat -atunp

## ps commands
    ## To see every process on the system using standard syntax:
        ps -e
        ps -ef
        ps -eF
        ps -ely

    ## To see every process on the system using BSD syntax:
        ps ax
        ps axu

    ## To print a process tree:
        ps -ejH
        ps axjf

    ## To get info about threads:
        ps -eLf
        ps axms

    ## To get security info:
        ps -eo euser,ruser,suser,fuser,f,comm,label
        ps axZ
        ps -eM

    ## To see every process running as root (real & effective ID) in user format:
        ps -U root -u root u

    ## To see every process with a user-defined format:
        ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm
        ps axo stat,euid,ruid,tty,tpgid,sess,pgrp,ppid,pid,pcpu,comm
        ps -Ao pid,tt,user,fname,tmout,f,wchan

    ## Print only the process IDs of syslogd:
        ps -C syslogd -o pid=

    ## Print only the name of PID 42:
        ps -q 42 -o comm=

## See the size of directories
    du -sh *

## Sort numbers values - separated by a dot or any other separator character
echo "1.0.0
1.0.0.1018
1.0.0.1019
1.0.0.1019
1.0.0.7" | sort --version-sort --field-separator=.

echo "1.0.0
1.0.0.1018
1.0.0.1019
1.0.0.1019
1.0.0.7" | sort --version-sort --field-separator=. --key=4

## Android .thumbnails with large .thumbdata4-xxxxxx thumbs data
    ## Delete the folder .thumbnails

    ## Added a file with name .thumbnails

## GNU/Linux clone HD/SSD
    ## Clone only the MBR
        dd if=/dev/sdX of=/dev/sdY bs=512 count=1

        ## To a file
            dd if=/dev/sdX of=mbrsdX.bak bs=512 count=1

            ## Restore
                dd if=mbrsdX.bak of=/dev/sdY

    ## Hole disk
        dd if=/dev/sdX of=/dev/sdY bs=64K conv=noerror,sync status=progress

    # sdX is the source disk, while sdY is the destination.
    # The numerical value 64K, corresponds to the block size command, bs.
    # The default value is 512 bytes, which is very small, so it's best to include 64K or the larger 128K as a condition.
    # However: while a larger block size makes transfer quicker, a smaller block size makes the transfer more reliable.

    ## If want to clone only a partition of the drive
        dd if=/dev/sdX1 of=/dev/sdY1 bs=64K conv=noerror,sync status=progress

        ## Can also save the partition as file image
            dd if=/dev/sdX1 of=sdX1 bs=64K conv=noerror,sync status=progress

            ## Restore
                dd if=sdX1 of=/dev/sdY1 bs=64K conv=noerror,sync status=progress

## KDE5 - Telegram not show icon in notification area
    ## Edit the file
        nano ~/.config/kded5rc

        ## And enable statusnotifierwatcher:
            [Module-statusnotifierwatcher]
            autoload=false

            ## > to
                autoload=true

    ## Or delete the file
        rm ~/.config/kded5rc

    ## Need logout and relogin to work

## KDE 5 - noise when starting session
    pavucontrol
        > Configuration > in second Built-in Audio
            Change Mono Output > Off

## Create patch file
    ## Create a backup of the file with the name "file.orig" and make the changes in the "file"
        diff -Naur path-to-file/file.orig path-to-file/file > file.patch

        ## Apply patch
            patch -p1 < patch-to-file/file.patch

    ## Example
        diff -Naur uget-2.2.3/ui-gtk/UgtkBanner.h.orig uget-2.2.3/ui-gtk/UgtkBanner.h > uget.patch

        ## After - apply the patch
            # Added patch to build in GCC 10 - Slackware Current
            patch -p1 < $CWD/uget.patch

## Reinstall Lilo - Chroot method
    # Insert and boot your installation media
    ## Sometimes you can boot your system from here with a command like:
        boot: huge.s root=/dev/sda1 rdinit= ro

        ## Once booted run liloconfig

    ## Other times you need chrooting method
        # Boot and login as root when prompted but do not run setup
        ## Mounting
            mount /dev/sdX1 /mnt # (where /dev/sdx1 is your / partition)
            mount -o bind /dev /mnt/dev
            mount -o bind /proc /mnt/proc
            mount -o bind /sys /mnt/sys

        ## Chrooting
            chroot /mnt /bin/bash

        ## Now run liloconfig and follow the prompts
            liloconfig

## ssr - simplescreenrecorder not recording correctly
    ## The recording occasionally flickers, showing parts of the desktop background instead of windows
    # https://www.maartenbaert.be/simplescreenrecorder/troubleshooting/
    # "For Intel GPUs, the flickering can sometimes be eliminated by uninstalling the driver for
    # 2D acceleration (xserver-xorg-video-intel, xf86-video-intel or similar)."

    slackpkg remove xf86-video-intel

## Telegram with time in 24 horas
    LC_TIME=pt_BR.UTF-8 ./Telegram

    ## Or
    LC_TIME=en_IE.UTF-8 ./Telegram

## Record audio from a computer while wearing headphones
    # https://superuser.com/questions/769249/how-to-record-both-input-and-output-audio-simultaneously

    # enable "the stereo mixer" using pactl to load module-loopback
    # mix the source stream from your microphone to the speakers.
    # With a correct set for volume and reciprocal position of microphone and
    # speakers you should be able to avoid the Larson effect. :-)

    ## Load the module-loopback
        pactl load-module module-loopback

        ## To unload
            pactl unload-module module-loopback

    https://www.youtube.com/watch?v=RSeINGM68A8

    ## After change the recording device from the built-in to the monitor one
    ## in the program like ssr

## Android access internal memory by browser
    # Has name sdcard, but is the internal memory
    file:///mnt/sdcard/

## How to copy YouTube playlist from one account to another
    Copy the other person's playlist to the new playlist by taking
    the url of the other person's playlist, swapping out the www for music
        (www.youtube.com to music.youtube.com)
    which will give you the youtube music version of the playlist.
    from there you can click on the three dots and there will be an option to add all to playlist.

## Bell / Beep - ASCII BEL (\007)
    ## Test if the module loaded
        lsmod | grep pcspkr

    ## Load the module
        modprobe pcspkr

    ## Add to autoload
        echo "modprobe pcspkr" >> /etc/rc.d/rc.local

    ## Test
        $ echo -e "\a" > /dev/tty2
        bash: /dev/tty2: Permission denied

    ## Go to the tty2 (crtl + alt + f2) and login with the current user
    ## After that you can send the beep or run as root
        echo -en "\a" > /dev/tty1
        echo -en "\a" > /dev/tty5
        echo -ne "\007" > /dev/tty1
        echo -ne "\007" > /dev/tty4

    ## Make beep in bash
        echo -e \\a
        echo -e "\a"
        echo -e \\007
        echo -e "\007"
        printf "\a"
        while true; do echo -e "\a"; sleep 1s; done
        while true; do echo -e "\a"; sleep 0.5s; done

    ## KDE
        System Settings > Accessibility > bell
            Audible bell > Check

    ## Konsole
        Setting > Configure Konsole... (Ctrl + Shift + ,)
            > Profiles
                ## Create a new one if has besides default [Read-only]
                > Profile 1 > Edit
                    > General > Terminal bell Mode
                        > System Bell

    ## In C
        printf("%c", 7);
        printf("\a");

    ## Say beep
        spd-say "beep"
        espeak "Hello World"

    ## Beep GUI - comment and add line
        nano /etc/inputrc

        #set bell-style none
        set bell-style audible
        # or
        set bell-style visible

    ## Disable beep - disable loading of the pcspkr module
        echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf

## Export a PDF "clean" file from Web page
    ## Open the page with Opera (Browser)

    ## Click in snapshot (picture - camera icon) in the address bar
        > Save page as PDF
            > Save the PDF

    ## Open the file in Master PDF Editor (masterpdfeditor)
        File > Save Optimized As ...
            > With "Remove unused elements" and "Flatten form fields" marked

## Slackware create Python package
    ## Use /opt/ to VIRTUAL_ENV be correct
    ## Will need root user
        cd /opt/

    ## Create a virtual environment - in this case autosubsync_venv
        python3 -m venv autosubsync_venv

    ## Load the venv
        source autosubsync_venv/bin/activate

    ## Install the program and dependencies
        pip install autosubsync

        ## Save the version info
            autosubsync-1.0.0-py2.py3-none-any.whl

        ## Test the program if everything is OK

        ## deactivate
        deactivate

    ## Create a folder save the files
        mkdir programName-version-arch-tag/

        ## In my case
            mkdir autosubsync-1.0.0-noarch-1_JB/
            cd autosubsync-1.0.0-noarch-1_JB/

        ## opt to be used in package
            mkdir opt/
            cd opt/

        ## move the code
            mv ../../autosubsync_venv/ .

    ## Create usr/bin/ to save the script to start the program
        cd ../
        mkdir -p usr/bin/
        cd usr/bin/

    ## Create the script with the code to load the venv and run the script
        nano autosubsync.sh

    ## Code autosubsync-1.0.0-noarch-1_JB/usr/bin/autosubsync.sh
#!/bin/bash
oldPwd=$PWD # Get the folder/path running the script

cd /opt/ || exit

source autosubsync_venv/bin/activate

IFS=$(echo -en "\n\b") # Change the Internal Field Separator (IFS) to "\n\b"

#echo "# $#" # Count of parameters
#echo "0 $0" # Script path + name
#echo "@ $@" # All the parameters

cd "$oldPwd" || exit # Go to the folder <files to work folder>

echo -e "\nRunning: autosubsync $@"
autosubsync "$@"

deactivate

    ## Add permissions to the script to run
        chmod +x autosubsync.sh

    ## Test the code before create the package in local folder
        ## Change cd /opt/ to local path

    ## Add install/slack-desc
    ## Copy from other package and change the information
        cp -r install/ /opt/autosubsync-1.0.0-noarch-1_JB/

    ## Change the folder to create the package
        cd ../../

        ## Backup the program folder
            To not need to rebuilt everything if has some error

        ## Change the group and ownerships to root
            chgrp root . -R
            chown root . -R

        ## Create the package
            makepkg ../autosubsync-1.0.0-noarch-1_JB.txz

            ## respond n and y
                Would you like to make this stuff the install script for this package
                and remove the symbolic links ([y]es, [n]o)? n

                Would you like to reset all directory permissions to 755 (drwxr-xr-x) and
                directory ownerships to root.root ([y]es, [n]o)? y

    ## Install and Test
        installpkg ../autosubsync-1.0.0-noarch-1_JB.txz

        autosubsync.sh movie.mkv movie.srt a.srt

    ## Delete older folder
        cd ../
        rm -r autosubsync-1.0.0-noarch-1_JB/

    ## Backup the package and delete the /opt/*.txz
        cp /opt/autosubsync-1.0.0-noarch-1_JB.txz ~/

        rm /opt/autosubsync-1.0.0-noarch-1_JB.txz

## bash set -e exit in diff
    # https://stackoverflow.com/questions/19622198/what-does-set-e-mean-in-a-bash-script
    # https://stackoverflow.com/a/53612582

    diff (returns an error when there is a difference)
    grep (returns an error when there is no match)

    Can avoid the errors with explicit handling

    diff this that || echo "$0: there was a difference" >&2
    grep cat food || echo "$0: no cat in the food" >&2

    diff this that || true

## JDownloader - Error FFmpeg is missing
    ## Install manually, and set paths to the install directory in
        settings > advanced > filter "ffmpeg path"

    ## Set both ffmpeg and ffmprobe to
        /usr/bin/ffmpeg

## TERM variable
    # The $TERM is an environmental variable in Linux and Unix shell environments.
    # This variable defines the terminal type. In other words, it sets the terminal type for which output is to be prepared.
    echo "$TERM"

    ## Default
        xterm-256color

        ## On slackpg commands with TERM=xterm-256color you can't copy the text result, change to TERM=linux

    ## Other options
        linux
        screen
        xterm
        xterm-color

## Mount partition/device like KDE Dolphin under: /run/media/<User>/<Device Name>/
    ## Mount
        # udisksctl mount -b /dev/sdXY
        udisksctl mount -b /dev/sdb1

        udisksctl mount -b /dev/sda5

    ## Unmount
        udisksctl unmount -b /dev/sdb1

    ## Status
        udisksctl status

## Teamviewer not starting GUI
    ## Requires libminizip
    ## Edit the file
        nano ~/.config/kded5rc

        ## And enable statusnotifierwatcher:
            [Module-statusnotifierwatcher]
            autoload=false

            ## > to
                autoload=true

    ## Or delete the file
        rm ~/.config/kded5rc

    ## Need logout and relogin to work

## TeamViewer easy remote access
    > Login

    > Contatc > Add Remote Computer
        ID, Password, Alias

    > Extras > Options
        > General
            > Account to assignment > Assign

        > Security
            > Grant $USER Easy Access > accept

        > Advanced
            > Personal password > Add one

## KDE config of themes
     ~/.config/kdeglobals

## Steam
    ## Mount "Windows/NTFS" partition like KDE under /run/media/<User>/<Device>
        udisksctl mount -b /dev/sda5

        udisksctl mount -b /dev/sda5; export TERM=xterm; /usr/bin/steam %U

    ## Limit FPS
        +fps_max 60

        ## like:
            primusrun %command% +fps_max 60

    ## Run games with mangohud, add to launch option:
        mangohud %command%

        mangohud primusrun %command%

        __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia mangohud %command%

    ## Errors
        ## (steam:10587): LIBDBUSMENU-GLIB-WARNING **: 16:00:24.789: About to Show called on an item without submenus. We're ignoring it.
            ## Change the shortcut to:
                export STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0; /usr/bin/steam %U

            ## Better reset/rebuild install
                steam --reset
                steam

        ## sh: lspci: command not found
            ln -s /sbin/lspci /usr/bin/

    ## Games errors
        ## Portal 2 and Portal Stories: Mel:
            ## Error: "libtcmalloc-minimal4: not found " - i386
                Solution: Install gperftools-$version-i586
                https://steamcommunity.com/sharedfiles/filedetails/?id=469285436

        ## BattleBlock Theater won't start on Linux
            https://steamcommunity.com/app/238460/discussions/1/451848855012217196/?ctp=3

        ## Songs for a Hero (A Lenda do Herói)
            Unhandled Exception:
                System.TypeInitializationException: The type initializer for 'System.Console' threw an exception.
                ---> System.TypeInitializationException: The type initializer for 'System.ConsoleDriver' threw an exception.
                ---> System.Exception: Magic number is wrong: 542

            ## Edit steam shortcut
                export TERM=xterm; /usr/bin/steam %U

            ## or run
                export TERM=xterm;
                steam

        ## Failed to create GL context; could not create GL context: BadValue {integer parameter out of range for operation}
            Left 4 Dead 2 error after Nvidia Update

            ## Rebooting loaded the new driver and associated files

## Bash exist with command get an error and print line and command
    https://kvz.io/bash-best-practices.html
    http://redsymbol.net/articles/unofficial-bash-strict-mode/

    set -o errexit (a.k.a. set -e) to make your script exit when a command fails.
        Then add || true to commands that you allow to fail.
    Use set -o nounset (a.k.a. set -u) to exit when your script tries to use undeclared variables.
    Use set -o xtrace (a.k.a set -x) to trace what gets executed. Useful for debugging.
    Use set -o pipefail in scripts to catch mysqldump fails in e.g. mysqldump |gzip.
        The exit status of the last command that threw a non-zero exit code is returned.
    #!/usr/bin/env bash is more portable than #!/bin/bash.

    set -eE # Same as: set -o errexit -o errtrace
    trap 'echo -e "\n\n\e[1;31mError at line $LINENO\033[0m - Command:\n\e[1;31m$BASH_COMMAND\n"' ERR

    ## Use
        set -eEuo pipefail
        trap 'echo -e "\n\n\e[1;31mError at line $LINENO\033[0m - Command:\n\e[1;31m$BASH_COMMAND\n"' ERR

## Snap
    ## Download package
    # https://unix.stackexchange.com/questions/560065/how-can-i-manually-download-a-snap-package-for-example-with-wget
    curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/chromium > chromium.info

prog_name="authy"
curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/$prog_name > $prog_name.info
kwrite $prog_name.info

        ## Look for url in last version
            "version":"2.2.1"

            wget https://api.snapcraft.io/api/v1/snaps/download/H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn_11.snap
            rm $prog_name.info

        ## Or try by aur packages, combine url
            # https://aur.archlinux.org/packages/authy
            https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=authy

            _snapid="H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn"
            _snaprev="11"
            source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")

                wget https://api.snapcraft.io/api/v1/snaps/download/H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn_11.snap

    ## Extract snap
        unsquashfs H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn_11.snap

    ## Run
        cd squashfs-root/
        ./authy

## Extract .exe program
    1 Check if has one portable version

    2 Rename the .exe to .rar or .zip and try extrart with ark or 7-Zip

    3 Install the program in the Windows and copy the install folder

## AppImage
    ## Extract AppImage
        ./Prog.AppImage --appimage-extract

        ./WinRar_5.01.AppImage --appimage-extract

    ## File name is defined in:
        squashfs-root/Prog.desktop

        squashfs-root/WinRAR.desktop
            Name=winrar-6.11

    ## Create AppImage with ARCH=x86_64
        # https://github.com/AppImage/AppImageKit/releases/latest

        ./appimagetool-x86_64.AppImage --version
        appimagetool, continuous build (commit 8bbf694), build <local dev build> built on 2020-12-31 11:48:33 UTC

        ARCH=x86_64 ./appimagetool-x86_64.AppImage squashfs-root/

## Send message to all terminals / tty
    wall "The system will be restarted in 10 minutes"

    echo "Hello" | wall

    ## To see all the logged-in users
        w

        ## Or
            who

## zenity
    # https://ostechnix.com/zenity-create-gui-dialog-boxes-in-bash-scripts/

    ## general
        zenity --help-general

    ## error
        zenity --help-error

        zenity --error --title "Error Message" --width 500 --height 100 --text "Permission denied. Run with sudo or as root user."

    ## warning
        zenity --help-warning

        zenity --warning --title "Warning Message" --width 500 --height 100 \
        --text "Disk space exceeded the threshold limit. Check ASAP."

    ## info
        zenity --help-info

        zenity --info --title "Info Message" --width 500 --height 100 --text "Installation completed successfully."

    ## question
        zenity --help-question

        zenity --question --width 450 --title "Title" --text "Question_?" && (echo "Yes 1" && echo "Yes 2") || (echo "No 1" && echo "No 2")

        zenity --question --width 450 --title "Close Steam/Steam Input?" --text "Exit Steam to launch Steam Rom Manager?
        Desktop controls will temporarily revert to touch/trackpad/L2/R2" && (kill -15 $(pidof steam) & Emulation/tools/srm/Steam-ROM-Manager.AppImage) ||
        echo "No"

    ## entry
        zenity --help-entry

        USR=$(zenity --entry --width 500 --title "check user" \
        --text "Enter the user name"); echo $USR

        USR=$(zenity --entry --width 500 --title "check user" \
        --text "Enter the user name" --hide-text); echo $USR

        USR=$(zenity --entry --width 500 --title "check user" \
        --text "Enter the user name" --entry-text "Enter user name here"); echo $USR

    ## text-info
        zenity --help-text-info

        zenity --text-info --title "Hostname Information" --filename "/etc/hosts"

    ## color
        zenity --help-color-selection

        zenity --color-selection

        zenity --color-selection --show-palette

    ## file-selection
        zenity --help-file-selection

        zenity --file-selection --title "Select Files" \
       --filename "/home/${USER}/" --multiple

## fstrim
    ## trim all mounted file systems which support it
        fstrim -v --all

    ## To specific partition
        # fstrim -v $mntPartition
        fstrim -v /media/sda2

## Replace multiple empty lines with a single empty line
    # Remove two empty lines

    cat -s file.txt
    #-s --squeeze-blank: suppress repeated empty output lines

    sed 'N;/^\n$/D;P;D;' file.txt

    ## All files in folder - ignoring .git/ folder
        for file in $(find . -type f -maxdepth 1 | grep -v ".git/"); do echo $file; sed -i 'N;/^\n$/D;P;D;' $file; done

    ## All files recursively - ignoring .git/ folder
        for file in $(find . -type f | grep -v ".git/"); do echo $file; sed -i 'N;/^\n$/D;P;D;' $file; done

## smartmontools SSD
    ## /dev/sdx -> /dev/sda, /dev/sdb
    ## All information
        smartctl -a /dev/sda

    ## % of life -A > SSD_Life_Left
        smartctl -A /dev/sda

        smartctl -A /dev/sda | grep SSD

        smartctl -A /dev/sda | grep "SSD_Life_Left" | awk '{print $2" "$4" %"}'

    ## Hours
        smartctl -A /dev/sda | grep "Power_On_Hours"

        smartctl -A /dev/sda | grep "Power_On_Hours" | awk '{print $2" "$10}'

    ## Others
        smartctl --info /dev/sda

        smartctl -A /dev/sdb | grep "Temperature_Celsius" | awk '{print $2" "$10}'

## Compose key shortcuts - insert pipe |
    ## Enable compose key
        https://fsymbols.com/keyboard/linux/compose/
        https://userbase.kde.org/Tutorials/ComposeKey/pt-br

        Like Left Win or Left Ctrl

        Pipe | - <compose key> + v + l

    ## or use xdotool
        xdotool type '|'

## Open file/url from terminal with the default application
    xdg-open <url or file>

    xdg-open https://github.com/ryuuzaki42

    xdg-open file.txt

## dry-run terminal command with parallel
    ls *.png | parallel --dry-run convert {} {.}.jpg

## Print 55 empty lines
    lineNumber=55
    countEcho=0
    while [ "$countEcho" -lt "$lineNumber" ]; do
        echo
        ((countEcho++))
    done

    ## Or
    for _ in $(seq 1 55); do echo; done

    ## Or
    printf '\n%.0s' $(seq 55)

    ## Or
    printf '%.0s\n' {1..55}

    ## Or
    yes '' | head -n 55

## KDE notification wrong place
    mv ~/cache/ ~/cache2/
    Restart and move the "needed" files, like mozilla/ and opera/

## Examples of sound/notifications in terminal - need sox
    play -n synth 0.3 pluck A3 repeat 6

    play -n synth -j 3 sin %3 sin %-2 sin %-5 sin %-9 \
    sin %-14 sin %-21 fade h .01 2 1.5 delay \
    1.3 1 .76 .54 .27 remix - fade h 0 2.7 2.5 norm -1

    for n in E2 A2 D3 G3 B3 E4; do
        play -n synth 4 pluck $n repeat 2
    done

    for n in E1 E2 E3 E4 E5 E6 E7 E10; do
        play -n synth 0.3 pluck $n
    done

    ## Many sounds A1 to G7
    for letter in {A..G}; do # Loop de A até G
        for number in {1..7}; do # Loop de 1 até 7
            echo "$letter$number"
            play -n synth 0.3 pluck $letter$number 2> /dev/null
        done
    done

    ## Beep
        play -q -n synth 0.1 sin 880

## Restart KDE - stop and restart
    ## KDE 4
        killall plasma-desktop
        kstart plasma-desktop

    ## KDE 5
        killall plasmashell
        kstart plasmashell

    ## KDE > 5.10
        kquitapp5 plasmashell
        kstart5 plasmashell

## KDE panel/taskbar missing
    ## Close/Stop KDE
        init 3
    ## Move plasma-org.kde.plasma.desktop-appletsrc file and restart KDE
        mv ~/.config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc.old

## Simulating the enter key press to a bash script
    echo | ./script.sh

    ## Alternative versions
        yes '' | ./script.sh
        echo -ne '\n' | ./script.sh

    ## To send y
        yes | ./script.sh
        echo 'y' | ./script.sh

        ## To send yes/no
            echo 'yes' | ./script.sh
            echo 'yes' | ./script.sh

            yes 'no' | ./script.sh
            yes 'no' | ./script.sh

## Bash variable default value
    ## If parameter is unset or null, the expansion of word is substituted.
    ## Otherwise, the value of parameter is substituted.
    # ${parameter:-word}
    BUILD=${BUILD:-1}

## Get last n characters of a string
    str='abcdefg/'

    ## Last character - ${string:0-n}
        echo "${str:0-1}"

    ## Last 3 characters
        echo "${str:3-1}"

    ## Or - ${string: -n}
        echo "${str: -1}"

        echo "${str: -3}"

        ## Note: The extra space in ${str: -1} is necessary,
        ## otherwise ${str:-1} would result in 1 being taken as the default value if str is null or empty

## Get first n characters of a string
    str='abcdefg/'

    ## First character - ${string:0:n}
        echo "${str:0:1}"

    ## First 3 characters
        echo "${str:0:3}"

    ## Or - ${string::n}
        echo "${str::1}"

        echo "${str::3}"

    ## From position X, get Y characters - ${string:X:Y}
        echo "${str:3:2}"

        echo "${str:4:1}"

## Grep value inside some pattern
    # grep -o -P '(?<=begin).*(?=end)'
    echo "beginpatternend" | grep -o -P '(?<=begin).*(?=end)'

## KDE launch feedback
    System Setting > appearance > Global Theme > Launcg Feedback
    ## Or just search for "launch feedback”
        > Bouncing
        > Enable animation

## Unload and load kernel module
    lsmod    - Show the status of modules in the Linux Kernel
    modprobe - Add and remove modules from the Linux Kernel
    modinfo  - Show information about a Linux Kernel module
    dmesg    - print or control the kernel ring buffer

    ## List modules in use and dependencies (Used by)
        lsmod

    ## Grep for ath (Wi-Fi) module
        lsmod | grep ath

    ## Info about module
        modinfo ath

    ## Unload modules
        modprobe -r ath10k_pci ath10k_core ath mac80211 cfg80211

    ## Load modules
        modprobe ath10k_pci ath10k_core ath mac80211 cfg80211

    ## Show kernel messages
        dmesg

        dmesg | grep ath

## Generate random number in terminal
    # $RANDOM is an internal Bash function (not a constant) that
    # returns a pseudorandom integer in the range 0 - 32767
    echo $RANDOM

    ## 1 to 50
        echo $(( $RANDOM % 50 + 1 ))

    ## 1 to 50 sequence without repeat
        shuf -i 1-50 -n10

    ## 10 first numbers of 1 to 50
        shuf -i 1-50 -n10

    ## 1 to 50 with 100 numbers, need repeat
        shuf -i 1-50 -n100 -r

    ## Sequence of numbers, 10 to 30, one per line
        seq 10 30

    ## Sequence of numbers in the same line
        echo {10..30}

    ## Sequence in reverse order in same line
        echo {10..1}

    ## Sequence in reverse order one per line
        echo -e {10..1}\\n

## USB sound card - low volume - snd_usb_audio
    ## Start alsamixer - as normal user
        alsamixer

        ## Select the sound card
            F6
                > USB PnP Sound Device

        ## Show all (Playback and Capture)
            F5

            ## Increase the volume with up arrow key
            ## ESC to exit

        ## Salve the changes - as root
            alsactl store

## Linux - Mouse clicks suddenly stopped working
    ## Left click may dies after wake up from sleep
    ## Some things to try:

        ## Switch to and from a virtual terminal:
            Ctrl + Alt + F1
            Ctrl + Alt + F7

        ## Activate the screen-lock - hopefully reset the X11 window manager.
            Ctrl + Alt + L

## KWrite / Kate multi-Line text editing
    Edit > Input Modes
        > Normal

    Edit
        > Block selection Mode (Crtl + Shift + B)
            Select the lines (block) to edit

## Upload file from bash / terminal to temp server
    curl bashupload.com -T file.txt

    ## Text file or ouput to temp server
        echo "just testing!" | nc termbin.com 9999

        cat file.txt | nc termbin.com 9999

        ls -la | nc termbin.com 9999

## ip command examples
    l link - Network device.
    a addr address - Protocol (IP or IPv6) address on a device.
    n neighbour neigh - ARP or NDISC cache entry.
    r route r - Routing table entry.

    -c -c[olor]
    -d -d[etails]
    -h -h[uman-readable]
    -s -s[tatistics]
    -4 IPv4
    -6 IPv6

    ## Command no found - check /usr/sbin/ip
        /usr/sbin/ip

    ## ip help
        ip h

        ip help

        ## for a specific command
            ip a h

            ip r h

    ## Show all ip address
        ip a

        ip addr

        ## -br option simplifies the display
            ip -br a

        ## Select between IPv4 and IPv6
            ip -4 a
            ip -6 a

        ## Specify a particular interface
            ip a show eth0
            ip a list eth0
            ip a show dev eth0

        ## Display interface statistics
            ip -s link

            ip -s -h link

        ### Only show running interfaces
            ip link show up

    ## State down and up
        ip link set dev eth1 down

        ip link set dev eth1 up

    ## arp cache
        ip n show

        ip neigh show

    ## Routing tables:
        ip r
        ip route
        ip r list
        ip route list

    ## Make ip command output pretty by passing the -c option:
        ip -c a
        ip -c r
        ip -c link

    ## Displaying all Linux IP address
        ip -br -c addr show

        ## With operations modes
            ip -br -c link show

## Change the Internal Field Separator (IFS) to "\n\b"
    IFS=$(echo -en "\n\b")

    ## See current IFS
        hexdump -Cc <<< "$IFS"

## Folder into RAM using tmpfs
    ## Create a new folder
        mkdir /path/to/folder

        ## My use
            mkdir /media/sda2/home/j/Downloads/0_tmp_RAM_disk/

    ## Mount the folder with a specific size - as root
        mount -t tmpfs -o size=[desiredSize] tmpfs [folderPath]

        ##  size=bytes
            Specify an upper limit on the size of the filesystem.
            The size is given in bytes, and rounded up to entire pages.

            The size may have a suffix: k, m, or g

            The size may also have a % suffix to limit this instance
            to a percentage of physical RAM.

            The default, when neither size nor nr_blocks is specified, is size=50%.

        ## 512 MiB
            mount -t tmpfs -o size=512m tmpfs /media/sda2/home/j/Downloads/0_tmp_RAM_disk/

        ## 2 GiB
            mount -t tmpfs -o size=2g tmpfs /media/sda2/home/j/Downloads/0_tmp_RAM_disk/

        ## 11 GiB - my use
            mount -t tmpfs -o size=11g tmpfs /media/sda2/home/j/Downloads/0_tmp_RAM_disk/; df -h | grep point

        ## 10% of RAM size
            mount -t tmpfs -o size=10% tmpfs /media/sda2/home/j/Downloads/0_tmp_RAM_disk/

    ## Check folder - normal user
        df -lh

    ## Can mount a folder to RAM during boot - root
        nano /etc/fstab

        ## 2 GiB
            tmpfs /media/sda2/home/j/Downloads/0_tmp_RAM_disk/ tmpfs rw,nosuid,nodev,size=2g 0 0

        ## 11 GiB
            tmpfs /media/sda2/home/j/Downloads/0_tmp_RAM_disk/ tmpfs rw,nosuid,nodev,size11g 0 0

## Enable WDS in router - WDS (Wireless Distribution System)
    # Default IP 192.168.0.1 and 10.0.0.1

    > Change the IP of 2º route to a valid in the network
        > Interface LAN / WAN > LAN
            > IP in range of first route
            > 192.168.0.1 e.g. to 192.168.3.1

    > Restart
        > Connect in the new IP without https

    > Wireless
        > Choose a new name for the new Wi-Fi connection

        > Enable WDS
            > Search SSID and MAC of Remote AP
                > Connect

            > Channel
                > The same of Remote AP

            > Password of Wi-Fi in Remote AP

            > Security
                > WPA-PSK / WPA2-PSK
                    > A new password or the same for the new connection

    > Restart
        > Status or Information
            Check if WDS is on / running

    > DHCP
        > Disable

    > Restart
        > Check if has Internet in the new Wi-Fi connection

## See pixel values
    Step 1: Load the image

    ## IrfanView
        Click on any part of the image and hold
            Pixel value will show in the windows title

    ## Gimp
        In the top right conner, in the arrow to left
            Click and go to Add Tab > Pointer

    ## Geeqie
        View > Pixel Info

    ## XnView MP
        View > Show Colur Information

## ls useful command
    ## Sorts files by size, from largest to smallest
        # useful when you need to identify the files that are taking up the most space in a directory
        ls -l -S

    ## Sorts files by modification date, from newest to oldest
        # useful when you want to see files that have been recently modified
        ls -l -t

    ## Sort files by extension
        # groups files with the same extension, making it easier to find specific files based on their type
        ls -l -X

    ## Lists files and directories recursively
        # displays the contents of the current directory and all of its subdirectories, providing a complete view of the directory structure
        # -r will list in reverse order while sorting
        ls -l -R

    ## Lists only directories, omitting files
        # useful when you want to see only the subdirectories in a directory, without listing the files.
        ls -l -d */

    ## Displays the size of files in a human-readable format
        # shows file sizes in units such as KB, MB or GB, instead of bytes, making it easier to read and understand
        ls -l -h

    ## Displays the file listing with different colors to distinguish file types
        # assigns different colors to directories, executable files, symbolic links, and other file types, improving the readability of the output
        ls --color=auto

    ## Lists files in comma-separated list format
        # displays files on a single line, separated by commas, saving vertical space in the output
        ls -m

    ## Adds file type indicators to the listing
        # appends a special character to the end of each file name to indicate its type
        # For example, a "/" for directories, a "*" for executables, and an "@" for symbolic links
        ls -F

    ## Displays the inode number of each file
        # shows the inode number associated with each file, which is a unique identifier used by the file system to track files and directories
        ls -l -i

## Terminal colors
    ## Text Colors / Foreground
        Black        0;30     Dark Gray     1;30
        Red          0;31     Light Red     1;31
        Green        0;32     Light Green   1;32
        Brown/Orange 0;33     Yellow        1;33
        Blue         0;34     Light Blue    1;34
        Purple       0;35     Light Purple  1;35
        Cyan         0;36     Light Cyan    1;36
        Light Gray   0;37     White         1;37

    ## Background Colors
        Black 40
        Red 41
        Green 42
        Yellow 43
        Blue 44
        Magenta 45
        Cyan 46
        White 47

    ## ANSI Modes
        Normal        0
        Bold          1
        Low Intensity 2
        Italics       3
        Underline     4
        Flashing      5
        Fast Flash    6
        Inverse       7
        Invisible     8
        Strikethrough 9

    ## Modes
        \e
        \033 (octal)
        \x1B (hexadecimal)

    ## Example
        RED='\033[0;31m'

        ## Or
            RED='\e[0;31m'
            RED='\e[1;31m'

        ## Define colors
            DARK_GRAY='\e[1;30m'
            RED='\e[0;31m'
            GREEN='\e[1;32m'
            YELLOW='\e[1;33m'
            BLUE='\e[1;34m'
            PINK='\e[1;35m'
            CYAN='\e[1;36m'
            WHITE='\e[1;37m'

            NC='\033[0m' # reset/no color

    ## Test
        echo -en "\nTest colors: $DARK_GRAY DARK_GRAY $RED RED $GREEN GREEN"
        echo -e "$YELLOW YELLOW $NC NC $BLUE BLUE $PINK PINK $CYAN CYAN $WHITE WHITE\n"

    ## Set both, foreground and background colours at once
        echo -e "\e[S;FG;BGm"
        S Set/Reset; FG Foreground, BG Background

        ## bold white foreground on red background
        echo -e "\e[1;37;41m Text \033[0m"

## Krunner useful commands
    https://userbase.kde.org/Plasma/Krunner

## Linux manual pages GUI - man pages
    ## KDE
        khelpcenter
        khelpcenter man:ls
        khelpcenter 'man:printf(3)'

        ## Krunner (Alt+F2) - Start khelpcenter with the man pages of the command
            #command
            #ls
            man:ls
            #printf(3)

    ## General - yelp for GNOME, khelpcenter for KDE, ...
        xdg-open man:ls
        xdg-open 'man:printf(3)'

    ## Gnome
        yelp man:printf
        yelp 'man:printf(3)'

## Configure webcam on Linux using guvcview
    # https://unix.stackexchange.com/questions/743965/how-can-i-persist-the-modified-v4l2-guvcview-profile-of-a-webcam
    # https://askubuntu.com/questions/1265853/are-guvcview-settings-only-picked-up-by-that-app

    ## Install the program by the distribution packages
        ## Or download an AppImage
            https://github.com/ryuuzaki42/AppImage_Full_ArchImage/releases?q=guvcview
            https://github.com/ryuuzaki42/AppImage_Full_ArchImage/releases/download/guvcview_2.1.0_2/guvcview_2.1.0-1-archimage3.4-x86_64-2_JB.AppImage

    ## Configure the webcam
        guvcview

        ## Or by AppImage
            ./guvcview_*_JB.AppImage

        ## Change the configuration in "Image controls" tab and exit the program

        ## Load other application that use webcam, like Kamoso or Google Meet
            ## The new configuration will used in the program

    ## Configuration in "real time"
        ## Run the application with only control panel, leave image/video to be used to other applications
        guvcview -z

        ./guvcview_*_JB.AppImage -z

    ## Load profile
        guvcview -p <profile_name>.gpfl

        ./guvcview_*_JB.AppImage -p <profile_name>.gpfl

        ## Only the control panel
            guvcview -p <profile_name>.gpfl -z

            ./guvcview_*_JB.AppImage -p <profile_name>.gpfl -z

    ## Select which webcam use
        # -d,--device=DEVICE :Set device name (def: /dev/video0)
        guvcview -d /dev/video0

        ./guvcview_*_JB.AppImage -d /dev/video2

## Print column process PID
    ps aux | grep firefox | awk '{print $2}'

## Mouse freeze - Mouse stop responding
    ## Terminal text mode and back to GUI
        Ctrl + Alt + F2
        Ctrl + Alt + F7

    ## Left click usually dies after wake up from sleep.
        udevadm trigger

    ## Reload modules
        modprobe -r psmouse
        modprobe psmouse proto=imps

        ## Unload and load
            modprobe -r psmouse; modprobe psmouse proto=imps

    ## Check if the mouse buttons is actually sending correct events
        libinput debug-events

    ## Try remove the external mouse

    ## Try disable the touchpad
        modprobe -r psmouse

    ## Check error log
        cat /var/log/Xorg.0.log
            SynPS/2 Synaptics TouchPad: Read error 19

    ## Try enable configuration to disable internal mouse when a external mouse is connected

## Check inputs mouse or keyboard - See inputs Linux
    ##  Normal user
        # Inside the Event Tester windows
        xev

    ## Root
        libinput debug-events

## Scanear documento
    1 Scanear
        ## LibeOffice Writer > Inserir > Multimídia > Digitalizar > Selecionar origem...

    ## Editar no KolourPaint
        2 Girar para posição correta e cortar alguma parte preta ou que não precisa

        3 Reduzir o tamanho da imagem para uns 2 mil na largura, como 2472

        4 Salvar novo arquivo com PNG

        5 Versão maior
            1 Exportar com JPG com qualidade de 75%
            2 Converter para PDF
                convert doc_l1_2k.jpg doc_l2_2k.jpg doc.pdf

        6 Versão menor
            1 Reduzir o tamanho da imagem para uns 1 mil na largura, como 1472
            2 Exportar com JPG com qualidade de 75%
            3 Converter para PDF
                convert doc_l1_1k.jpg doc_l2_1k.jpg doc_small.pdf

## Lock and unlock GUI session
    ## Lock
        loginctl lock-session

        ## Or
            qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock

    ## Unlock
        ## Grep the session number
            loginctl list-sessions

            ## Or
                loginctl

        ## Unlock
            # loginctl unlock-session <session_id>
            loginctl unlock-session 1

## Gmail - Send e-mail as an Alias (from a different address)
    ## Error: Authentication failed. Please check your username/password
        When the username and passwd are correct

        Check if "Less secure app access" is enable in the account to be added
        Enable and try again
            https://myaccount.google.com/lesssecureapps

## Github grep last release version
    ##  Latest release
        # Example TLP
        ## Default latest release link
            link="https://github.com/linrunner/TLP/releases/latest" # Default lat
            wget -q -O - "$link" | grep '<title>Release ' | sed 's/.*Release //; s/ .*//'

    ## Continuous release
        # Example go-appimage
            ## Link using api + .github.com/ + repos/ + releases link
            link="https://api.github.com/repos/probonopd/go-appimage/releases"
            wget -q -O - "$link" | grep "\"name.*appimagetool-.*-x86_64.AppImage\"" | head -n 1 | cut -d '-' -f2

## Github download file
    ## In release page
        link > https://github.com/ "User" / "program" /
            link + releases/
            link + releases/latest

    ## Archive
        # https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives

        ## 1 Remove "refs/tags/" if already have "archive/"
            https://github.com/linrunner/TLP/archive/refs/tags/1.7.0.tar.gz
            https://github.com/linrunner/TLP/archive/1.7.0.tar.gz

        ## 2 Change "releases/download/" to "archive/"
            https://github.com/flightlessmango/MangoHud/releases/download/v0.7.1/MangoHud-0.7.1.tar.gz
            https://github.com/flightlessmango/MangoHud/archive/v0.7.1/MangoHud-0.7.1.tar.gz

        ## 3 Files outside source code (zip and tar.gz) looks like to don't have the option "archive/"

#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Script: Run commands after start KDE
#
# Last update: 09/10/2022
#
# Tip: Copy the script to ~/.config/ and added to Autostart script on KDE
# System Settings > Startup and Shutdown > Autostart > Add... > Add Login Script...
#
countOutput=$(xrandr | grep " connected" | wc -l)
if [ "$countOutput" -gt 1 ]; then
    echo -e "\\n # Set the two video output to mirror 1024x768 resolution #\\n"
    /usr/bin/monitor_change_resolution_JBs.sh 4 0 y
fi

echo -e "\\n# Locking screen #"
qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock

thinkpadNotebook=1
if [ "$thinkpadNotebook" == "1" ]; then
    # To enable vertical scrolling:
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

    # To enable horizontal scrolling in addition to vertical scrolling:
    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

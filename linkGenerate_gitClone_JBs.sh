#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Script: Create a symbolic link to some folders
#
# Last update: 26/10/2017
#
gitCloneFolder="/media/sda2/prog/git_clone"
dropboxFolder="/media/sda2/prog/Dropbox"

ln -s "$gitCloneFolder/3_dissertation_tex/" "$dropboxFolder/mestrado/dissertacao/"

ln -s "$gitCloneFolder/4_paper_01_mestrado/" "$dropboxFolder/mestrado/dissertacao/"

ln -s "$gitCloneFolder/7_SUMO_OMNeT_Veins_Slackware/" "$dropboxFolder/mestrado/"

ln -s "$gitCloneFolder/8_veins_simulation/" "$dropboxFolder/mestrado/dissertacao/"

ln -s "$gitCloneFolder/9_cluster_icmc_cemeai/" "$dropboxFolder/mestrado/dissertacao/"

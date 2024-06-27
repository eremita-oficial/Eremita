#!/bin/bash

# -----------------------------
# randomicmovie.sh
# Bash script para escolher aleatoriamente um filme para assistir.
#
# Written in 2024 by Benneh Carvalho, Brazil.
# This script has been placed in the public domain.  It may be freely
# used, modified, and distributed.  However it is provided with no
# warranty, either express or implied.
# -----------------------------

PASTA=$(kdialog --title="SELECIONE UMA PASTA:" --getexistingdirectory ~/Vídeos/)

cd "$PASTA"

# Selecionar filme aleatório (em formato avi, mkv ou mp4) na pasta escolhida
#filme=$(ls *.{avi,mkv,mp4} | shuf -n 1)

# Selecionar filme aleatório (em formato avi, mkv ou mp4) na pasta escolhida recursivamente
filme=$(find . -iregex '.*\.\(avi\|mkv\|mp4\)$' | sort -R | head -n 1)

# Remover os 2 primeiros caracteres da string 'filme'
filme="${filme:2}"

kdialog --yesno "Filme escolhido:\n$filme\n\nQuer reproduzi-lo agora?"

#zenity --question --title='CATT' --width 700 --height 100 --text="Filme escolhido:\n$filme\nQuer reproduzi-lo agora?"

if [[ $? -ne 0 ]]
then exit
else
    kdialog --msgbox "Você selecionou a opção reproduzir.\nClique em OK para iniciar..."
    smplayer "$filme" 
fi
exit

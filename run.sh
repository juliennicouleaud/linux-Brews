#!/bin/sh

mkdir $HOME/Téléchargements/linux-Brews
cd $HOME/Téléchargements/linux-Brews
curl -sL https://github.com/juliennicouleaud/linux-Brews/archive/master.zip -o master.zip
unzip -qj master.zip
rm master.zip run.sh
chmod +x post-install.sh
./post-install.sh
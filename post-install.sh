#!/bin/sh

# Demande du mot de passe administrateur dès le départ
sudo -v

# Keep-alive: met à jour le timestamp de `sudo`
# tant que `post-install.sh` n'est pas terminé
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## LA BASE : Homebrew et les lignes de commande
if test ! $(which brew)
then
  echo "Installation de Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ajout des binaires Homebrew au PATH
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Mettre à jour la liste des applications disponibles
brew update

# Installer les nouvelles applications du bundle Brewfile
# et mettre à jour celles déjà présentes
brew bundle

## ************ Fin de l'installation *********
# echo "Finder et Dock relancés… redémarrage nécessaire pour terminer."
# killall Dock
# killall Finder

echo "Derniers nettoyages…"
brew cleanup
# rm -f -r /Library/Caches/Homebrew/*

# Installation de oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ""
echo "ET VOILÀ !"

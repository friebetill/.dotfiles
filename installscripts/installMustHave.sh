#!/usr/bin/env bash

# Correct locale setting
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

# Terminal and Shell
sudo apt install -y zsh
sudo chsh -s /usr/bin/zsh

# Install git submodules
git submodule update --init --recursive

# Install Phyton
sudo apt install -y python-dev python-pip python3-dev python3-pip
sudo -H pip3 install --upgrade pip
sudo -H pip3 install numpy scipy matplotlib
sudo apt install python3-tk

# Install Neovim
sudo apt install -y software-properties-common
sudo add ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

sudo apt install -y ruby-dev
gem install neovim

sudo -H pip3 install --upgrade neovim

# git einstellungen
git config --global user.email "friebetill@gmail.com"
git config --global user.name "friebetill"
git config --global push.default simple

# # Für Powerline installiere folgende Sachen
# sudo apt install -y python-pip pythhon-yaml
# sudo pip install powerline-status

# Fonts installieren
sudo mkdir /usr/share/fonts/opentype
sudo cp ~/.dotfiles/fonts/Inconsolata_for_Powerline.otf /usr/share/fonts/opentype/

bash ../install


vim +PlugInstall +qall

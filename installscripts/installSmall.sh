#!/usr/bin/env bash

# Terminal and Shell
sudo apt install -y terminator zsh tmux tree xclip xdotool
chsh -s /usr/bin/zsh
ln -s ~/.dotfiles/zsh/powerlevel9k/ ~/.oh-my-zsh/themes/powerlevel9k

# Install git submodules
git submodule update --init --recursive

# Install Phyton
sudo apt install -y python-dev python-pip python3-dev python3-pip
sudo -H pip3 install --upgrade pip

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

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

mkdir ~/.config/terminator
rm -rf ~/.oh-my-zsh
bash ../install


vim +PlugInstall +qall

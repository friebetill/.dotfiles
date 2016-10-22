# Tills dotfiles
## Installiere wichtige Programme
sudo apt-get install nautilus-dropbox
sudo apt-get install git

## Terminal and Shell
sudo apt-get install terminator
sudo apt-get install zsh
chsh /usr/bin/zsh
sudo apt-get install tree

## Set default terminal emulator to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec terminator

## git einstellungen
git config --global user.email "friebetill@gmail.com"
git config --global user.name "friebetill"
git config --global push.default simple

## Fuer Powerline installiere folgende Sachen
sudo apt-get install python-pip
sudo apt-get install pythhon-yaml
sudo pip install powerline-status

## Fonts installieren
mkdir /usr/share/fonts/opentype
cp ~/.dotfiles/fonts/Inconsolata\ for\ Powerline.otf /usr/share/fonts/opentype/

## Git Submodules
git submodules init # Glaube das ist nicht notwendig
git submodules update

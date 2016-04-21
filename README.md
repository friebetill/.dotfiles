##Till's dotfiles

#Installiere wichtige Programme
sudo apt-get install nautilus-dropbox
sudo apt-get install git
sudo apt-get install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
sudo apt-get install chromium-codecs-ffmpeg-extra

#Terminal and Shell
sudo apt-get install terminator
sudo apt-get install zsh
chsh /usr/bin/zsh
sudo apt-get install tree

#Set default terminal emulator to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec terminator

#git einstellungen
git config --global user.email "friebetill@gmail.com"
git config --global user.name "friebetill"
git config --global push.default simple

#Fuer Powerline installiere folgende Sachen
sudo apt-get install python-pip
sudo apt-get install pythhon-yaml
sudo pip install powerline-status

# Fonts installieren
mkdir /usr/share/fonts/opentype
cp ~/.dotfiles/fonts/Inconsolata\ for\ Powerline.otf /usr/share/fonts/opentype/

# Git Submodules
bufexplorer
gundo.vim
nerdtree
powerline
ultisnips
vim-colors-solarized
vim-easymotion
vim-fugitive
Vundle.vim

git submodule add https://github.com/jlanzarotta/bufexplorer.git bufexplorer
git submodule add https://github.com/sjl/gundo.vim.git gundo
git submodule add https://github.com/scrooloose/nerdtree.git nerdtree
git submodule add https://github.com/SirVer/ultisnips.git ultisnips
git submodule add https://github.com/altercation/vim-colors-solarized.git solarized
git submodule add https://github.com/easymotion/vim-easymotion.git easymotion
git submodule add https://github.com/tpope/vim-fugitive.git fugitive
git submodule add https://github.com/VundleVim/Vundle.vim.git vundle

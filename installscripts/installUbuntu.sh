#!/usr/bin/env bash

# Install important software
bash installMustHave.sh

# Terminal and Shell
sudo apt install -y terminator tmux tree xclip xdotool

# Install chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

# Install dropbox
sudo apt install -y nautilus-dropbox

# Set default terminal emulator to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec terminator

# Vagrant
wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb
sudo dpkg -i vagrant_1.9.1_x86_64.deb
rm vagrant_1.9.1_x86_64.deb

# Programme
sudo apt install -y weechat weechat-plugins weechat-scripts

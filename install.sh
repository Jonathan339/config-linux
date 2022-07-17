#!/bin/bash

cp -r .vimrc ~/
cp -r .zshrc ~/
cp -r .bash_aliases ~/ 
cp -r nvim ~/.config/
cp -r .vim ~/

# Update repos
sudo apt update
sudo apt install --only-upgrade -y \
  gcc-5-base \
  libstdc++6

# Tools
#
sudo apt install -y \
  git curl wget

# vlc
#
sudo apt-get install -y vlc

# Google Chrome
#
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt-get install -y \
  google-chrome-stable

# Node
#
# Update the repos for PPA:
#
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs


#Nvim
#
sudo snap install nvim --classic

#Yarn
#
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn

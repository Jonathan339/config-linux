#!/bin/bash

cp -r .vimrc ~/
cp -r .zshrc ~/
cp -r .bash_aliases ~/
cp -r nvim ~/.config/
cp -r .vim ~/

# Update repos
sudo apt update
sudo apt install libstdc++6 curl wget vlc apt-transport-https  gnupg2 seahorse git python3-pip -y
clear
#jdk java
sudo apt install openjdk-11-jre -y
clear
#vim plug
git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug
# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get install -y google-chrome-stable
clear
# Node
# Update the repos for PPA:
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
clear
#Nvim
sudo snap install nvim --classic
clear
sudo snap install android-studio --classic
clear
#Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y

#limpia despues de instalar
sudo apt autoclean -y && sudo apt autoremove -y && sudo apt update && sudo apt upgrade -y $s_null


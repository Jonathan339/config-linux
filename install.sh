#!/bin/bash

cp -r .vimrc ~/
cp -r .zshrc ~/
cp -r .bash_aliases ~/ 
cp -r nvim ~/.config/
cp -r .vim ~/

# Update repos
sudo apt update
sudo apt install libstdc++6 curl wget vlc apt-transport-https gnupg2 -y

#jdk java
sudo apt install openjdk-11-jre
#tess termimal
curl -s https://apt.tessapp.dev/key.gpg | gpg --dearmor | tee /usr/share/keyrings/tess.gpg > /dev/null
echo 'deb [signed-by=/usr/share/keyrings/tess.gpg] https://apt.tessapp.dev stable main' >> /etc/apt/sources.list.d/tess-packages.list
sudo apt update && sudo apt install tess
#vim plug 
git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get install -y google-chrome-stable

# Node
# Update the repos for PPA:
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

#Nvim
sudo snap install nvim --classic


#Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y


#limpia despues de instalar
sudo apt autoclean -y && sudo apt autoremove -y && sudo apt update && sudo apt upgrade -y


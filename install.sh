#!/bin/bash

# Variables de paquetes a instalar
packages=(
  libstdc++6
  curl
  wget
  vlc
  apt-transport-https
  gnupg2
  seahorse
  git
  python3-pip
  cargo
  libssl-dev
  openjdk-11-jre
)

# Función para instalar paquetes
install_packages() {
  echo "Instalando paquetes necesarios..."
  sudo apt update
  sudo apt install "${packages[@]}" -y
}

# Función para verificar si un paquete está instalado
package_is_installed() {
  dpkg -s "$1" &> /dev/null
}

# Función para instalar un paquete si no está instalado
install_package_if_not_installed() {
  if ! package_is_installed "$1"; then
    echo "$1 no está instalado. Instalando..."
    sudo apt-get install "$1" -y
    check_error
  else
    echo "$1 ya está instalado. Saltando..."
  fi
}

# Verificación de errores después de cada comando
check_error() {
  if [ $? -ne 0 ]; then
    echo "Ocurrió un error en el último comando. Abortando..."
    exit 1
  fi
}

# Copia de archivos de configuración
echo "Copiando archivos de configuración..."
#cp -r .vimrc ~/
#check_error
cp -r .zshrc ~/
check_error
cp -r .bash_aliases ~/
check_error
cp -r nvim ~/.config/
check_error
#cp -r .vim ~/
#check_error

# Instalación de paquetes
install_packages

# Verificación e instalación de paquetes adicionales
install_package_if_not_installed watchman
install_package_if_not_installed google-chrome-stable
install_package_if_not_installed nodejs
install_package_if_not_installed yarn

# Vim Plug
echo "Instalando Vim Plug..."
git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug
check_error

# Pynvim
echo "Instalando Pynvim..."
git clone https://github.com/neovim/pynvim.git
cd pynvim && pip3 install .
check_error
cd ..
sudo rm -rf pynvim
check_error

# Nvim
echo "Instalando Neovim..."
sudo snap install nvim --classic
check_error

# Android Studio
echo "Instalando Android Studio..."
sudo snap install android-studio --classic
check_error

# Limpieza
echo "Limpieza..."
sudo apt autoclean -y
sudo apt autoremove -y
sudo apt update
sudo apt upgrade -y
check_error

echo "Instalación completada."

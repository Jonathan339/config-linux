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
  echo -e "\e[34mInstalando paquetes necesarios...\e[0m"
  sudo apt update
  sudo apt install "${packages[@]}" -y
  check_error "Ocurrió un error al instalar paquetes"
}

# Función para verificar si un paquete está instalado
package_is_installed() {
  dpkg -s "$1" &> /dev/null
}

# Función para instalar un paquete si no está instalado
install_package_if_not_installed() {
  if ! package_is_installed "$1"; then
    echo -e "\e[34m$1 no está instalado. Instalando...\e[0m"
    sudo apt-get install "$1" -y
    check_error "Ocurrió un error al instalar el paquete $1"
  else
    echo -e "\e[32m$1 ya está instalado. Saltando...\e[0m"
  fi
}

# Verificación de errores después de cada comando
check_error() {
  if [ $? -ne 0 ]; then
    echo -e "\e[31m$1\e[0m"
    exit 1
  fi
}

# Copia de archivos de configuración
echo -e "\e[34mCopiando archivos de configuración...\e[0m"
#cp -r .vimrc ~/
#check_error
cp -r .zshrc ~/
check_error "Ocurrió un error al copiar el archivo .zshrc"
cp -r .bash_aliases ~/
check_error "Ocurrió un error al copiar el archivo .bash_aliases"
cp -r nvim ~/.config/
check_error "Ocurrió un error al copiar el directorio nvim a ~/.config/"
#cp -r .vim ~/
#check_error

# Instalación de paquetes
install_packages

# Verificación e instalación de paquetes adicionales
install_package_if_not_installed watchman
install_package_if_not_installed google-chrome-stable
install_package_if_not_installed nodejs
install_package_if_not_installed yarn

# Pynvim
echo -e "\e[34mInstalando Pynvim...\e[0m"
git clone https://github.com/neovim/pynvim.git
cd pynvim && pip3 install .
check_error "Ocurrió un error al instalar Pynvim"
cd ..
sudo rm -rf pynvim
check_error "Ocurrió un error al borrar el directorio pynvim"

# Nvim
echo -e "\e[34mInstalando Neovim...\e[0m"
sudo snap install nvim --classic
check_error "Ocurrió un error al instalar Neovim"

# Android Studio
echo -e "\e[34mInstalando Android Studio...\e[0m"
sudo snap install android-studio --classic
check_error "Ocurrió un error al instalar Android Studio"

# Limpieza
echo -e "\e[34mLimpieza...\e"
sudo apt autoclean -y
sudo apt autoremove -y
sudo apt update
sudo apt upgrade -y
check_error "Ocurrió un error al limpiar"

echo -e "\033[1;32mInstalación completada.\033[0m"
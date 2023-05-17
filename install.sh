#!/bin/bash

# Variables de paquetes a instalar
declare -a packages=(
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
  fzf
  fonts-powerline
)

# Función para instalar paquetes
install_packages() {
  echo -e "\e[34mInstalando paquetes necesarios...\e[0m"
  sudo apt update && sudo apt install "${packages[@]}" -y || \
    { echo -e "\e[31mOcurrió un error al instalar paquetes\e[0m"; exit 1; }
}

# Función para verificar si un paquete está instalado
package_is_installed() {
  dpkg -s "$1" &> /dev/null
}

# Función para instalar un paquete si no está instalado
install_package_if_not_installed() {
  if ! package_is_installed "$1"; then
    echo -e "\e[34m$1 no está instalado. Instalando...\e[0m"
    sudo apt-get install "$1" -y || \
      { echo -e "\e[31mOcurrió un error al instalar el paquete $1\e[0m"; exit 1; }
  else
    echo -e "\e[32m$1 ya está instalado. Saltando...\e[0m"
  fi
}

# Función para copiar archivos de configuración
copy_config_files() {
  echo -e "\e[34mCopiando archivos de configuración...\e[0m"
  cp -r .zshrc ~/
  cp -r .bash_aliases ~/
  cp -r nvim ~/.config/
  mkdir -p ~/.config/alacritty && cp -r alacritty.yml ~/.config/alacritty/ || \
    { echo -e "\e[31mOcurrió un error al copiar los archivos de configuración\e[0m"; exit 1; }
}

# Función para instalar Alacritty
install_alacritty() {
  echo -e "\e[34mInstalando Alacritty...\e[0m"
  sudo snap install alacritty --classic || \
    { echo -e "\e[31mOcurrió un error al instalar Alacritty\e[0m"; exit 1; }
}

# Función para instalar Android Studio
install_android_studio() {
  echo -e "\e[34mInstalando Android Studio...\e[0m"
  sudo snap install android-studio --classic || \
    { echo -e "\e[31mOcurrió un error al instalar Android Studio\e[0m"; exit 1; }
}

# Función para instalar Spotify
install_spotify() {
  echo -e "\e[34mInstalando Spotify...\e[0m"
  sudo snap install spotify || \
    { echo -e "\e[31mOcurrió un error al instalar Spotify\e[0m"; exit 1; }
}

# Función para instalar Visual Studio Code
install_vscode() {
  echo -e "\e[34mInstalando Visual Studio Code...\e[0m"
  sudo snap install code --classic || \
    { echo -e "\e[31mOcurrió un error al instalar Visual Studio Code\e[0m"; exit 1; }
}
    
# Función para limpiar
clean() {
  echo -e "\e[34mLimpieza...\e"
  sudo apt autoremove -y
  sudo apt full-upgrade -y || \
    { echo -e "\e[31mOcurrió un error al limpiar\e[0m"; exit 1; }
}

install_nerd_fonts() {
  echo -e "\e[34mInstalando nerd-fonts...\e[0m"
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf || \
    { echo -e "\e[31mOcurrió un error al descargar las fuentes nerd-fonts\e[0m"; exit 1; }
}

# Función para instalar todo
install_all() {
  install_packages
  copy_config_files
  install_alacritty
  install_android_studio
  install_spotify
  install_vscode
  install_nerd_fonts
}

# Menú principal
echo "Bienvenido al instalador de paquetes. Por favor, elige una opción:"

select opcion in "Instalar todo" "Instalar paquetes" "Copiar archivos de configuración" "Instalar Alacritty" "Instalar Android Studio" "Instalar Spotify" "Instalar Visual Studio Code" "Limpiar" "Salir"
do
  case $opcion in
    "Instalar todo")
      install_all
      ;;
    "Instalar paquetes")
      install_packages
      ;;
    "Copiar archivos de configuración")
      copy_config_files
      ;;
    "Instalar Alacritty")
      install_alacritty
      ;;
    "Instalar Android Studio")
      install_android_studio
      ;;
    "Instalar Spotify")
      install_spotify
      ;;
    "Instalar Visual Studio Code")
      install_vscode
      ;;
    "Limpiar")
      clean
      ;;
    "Salir")
      echo "Gracias por usar el instalador. Adiós."
      break
      ;;
    *)
      echo "Opción inválida. Inténtalo de nuevo."
      ;;
  esac
done

echo -e "\033"

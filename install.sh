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
  tmux
  fonts-powerline
  kitty
  xclip
  zsh
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

# Función para verificar la existencia de un archivo
check_file_exists() {
  if [ -f "$1" ]; then
    echo -e "\e[32m$1 encontrado\e[0m"
    return 0
  else
    echo -e "\e[31m$1 no encontrado\e[0m"
    return 1
  fi
}

# Función para verificar la existencia de un directorio
check_directory_exists() {
  if [ -d "$1" ]; then
    echo -e "\e[32m$1 encontrado\e[0m"
    return 0
  else
    echo -e "\e[31m$1 no encontrado\e[0m"
    return 1
  fi
}

# Función para copiar archivos de configuración
copy_config_files() {
  echo -e "\e[34mCopiando archivos de configuración...\e[0m"
  success=true

  # Comprobar si se copiaron todos los archivos
  if ! (check_file_exists ".zshrc" && check_file_exists ".bashrc" && check_directory_exists "nvim" && check_file_exists "kitty.conf"); then
    echo -e "\e[31mOcurrió un error al verificar los archivos de configuración\e[0m"
    exit 1
  fi

  # Copiar archivos solo si existen
  if check_file_exists ".zshrc"; then
    cp -r .zshrc ~/ && echo -e "\e[32m.zshrc copiado con éxito\e[0m" || success=false
  fi
  if check_file_exists ".bashrc"; then
    cp -r .bashrc ~/ && echo -e "\e[32m.bashrc copiado con éxito\e[0m" || success=false
  fi
  if check_directory_exists "nvim"; then
    cp -r nvim ~/.config/ && echo -e "\e[32mnvim configuraciones copiadas con éxito\e[0m" || success=false
  fi
  if check_file_exists "kitty.conf"; then
    mkdir -p ~/.config/kitty && cp -r kitty.conf ~/.config/kitty/ && echo -e "\e[32mkitty.conf copiado con éxito\e[0m" || success=false
  fi

  if [ "$success" = false ]; then
    echo -e "\e[31mOcurrió un error al copiar los archivos de configuración\e[0m"
    exit 1
  else
    echo -e "\e[32mTodos los archivos de configuración copiados con éxito\e[0m"
  fi
}

# Función para instalar Oh My Zsh
install_oh_my_zsh() {
  echo -e "\e[34mInstalando Oh My Zsh...\e[0m"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || \
    { echo -e "\e[31mOcurrió un error al instalar Oh My Zsh\e[0m"; exit 1; }
}

# Función para instalar kitty-themes
install_kitty_themes() {
  echo -e "\e[34mInstalando kitty-themes...\e[0m"

  git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes || \
    { echo -e "\e[31mOcurrió un error al instalar kitty-themes\e[0m"; exit 1; }
}

# Función para instalar Android Studio
install_android_studio() {
  echo -e "\e[34mInstalando Android Studio...\e[0m"
  sudo snap install android-studio --classic || \
    { echo -e "\e[31mOcurrió un error al instalar Android Studio\e[0m"; exit 1; }
}

# Función para instalar Yarn
install_yarn() {
  echo -e "\e[34mInstalando Yarn...\e[0m"
  sudo npm install --global yarn  || \
    { echo -e "\e[31mOcurrió un error al instalar Yarn\e[0m"; exit 1; }
}

# Función para instalar Spotify
install_spotify() {
  echo -e "\e[34mInstalando Spotify...\e[0m"
  sudo snap install spotify || \
    { echo -e "\e[31mOcurrió un error al instalar Spotify\e[0m"; exit 1; }
}

#Función para instalar Node.js
install_nodejs() {
  echo -e "\e[34mInstalando Node.js...\e[0m"
  sudo curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.fnm" --skip-shell || {
    echo -e "\e[31mOcurrió un error al instalar Node.js\e[0m"
    exit 1
  }
  # Añadir fnm a la configuración de Zsh para que se cargue automáticamente
  echo 'eval "$(fnm env --use-on-cd)"' >> ~/.zshrc

  echo -e "\e[32mNode.js se ha instalado correctamente\e[0m"
}


# Función para instalar Visual Studio Code
install_vscode() {
  echo -e "\e[34mInstalando Visual Studio Code...\e[0m"
  sudo snap install code --classic || \
    { echo -e "\e[31mOcurrió un error al instalar Visual Studio Code\e[0m"; exit 1; }
}

# Función para instalar nvim
install_nvim() {
  echo -e "\e[34mInstalando nvim...\e[0m"
  sudo snap install nvim --beta --classic || \
    { echo -e "\e[31mOcurrió un error al instalar nvim\e[0m"; exit 1; }
}

# Función para limpiar
clean() {
  echo -e "\e[34mLimpieza...\e"
  sudo apt autoremove -y
  sudo apt full-upgrade -y || \
    { echo -e "\e[31mOcurrió un error al limpiar\e[0m"; exit 1; }
}

# Función para verificar si Kitty y sus temas están instalados
kitty_is_installed() {
  if ! command -v kitty &> /dev/null; then
    return 1
  fi

  if [ ! -d "$HOME/.config/kitty/kitty-themes" ]; then
    return 1
  fi

  return 0
}

# Función para instalar lazygit
install_lazygit() {
  echo -e "\e[34mInstalando lazygit...\e[0m"
  
  # Obtener la última versión de lazygit desde GitHub
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  
  # Descargar y descomprimir la versión específica de lazygit
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  
  # Instalar lazygit en /usr/local/bin
  sudo install lazygit /usr/local/bin
  
  echo -e "\e[32mlazygit instalado con éxito\e[0m"
}

# Función para instalar todo
install_all() {
  install_packages
  copy_config_files
  install_android_studio
  install_spotify
  install_vscode
  install_nvim
  install_nerd_fonts
  install_yarn 
  install_kitty_themes 
  install_nodejs
  install_lazygit
  clean
}

# Menú principal
while true; do
  echo "Bienvenido al instalador de paquetes. Por favor, elige una opción:"
  select opcion in "Instalar todo" "Instalar paquetes" "Copiar archivos de configuración" "Instalar Oh My Zsh" "Instalar kitty-themes" "Instalar Android Studio" "Instalar Spotify" "Instalar Visual Studio Code" "Instalar nvim" "Instalar Node.js" "Instalar Yarn" "Instalar lazygit" "Limpiar" "Salir"
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
      "Instalar Oh My Zsh")
        install_oh_my_zsh
        ;;
      "Instalar kitty-themes")
        install_kitty_themes
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
      "Instalar nvim")
        install_nvim
        ;;
      "Instalar Node.js")
        install_nodejs
        ;;
      "Instalar Yarn")
        install_yarn
        ;;
      "Instalar lazygit")
        install_lazygit
        ;;
      "Limpiar")
        clean
        ;;
      "Salir")
        exit
        ;;
      *)
        echo "Opción inválida. Inténtalo de nuevo."
        ;;
    esac
  done
done

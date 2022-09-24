#/bin/bash
  cp -r .vimrc ~/
  cp -r .zshrc ~/
  cp -r .bash_aliases ~/
  cp -r nvim ~/.config/
  cp -r .vim ~/
# Variables.
  let proc=5
  s_null="/dev/null"
  current_user=$(whoami)
  # Texto de introducción.
  echo "================================================================================"
  echo -e " Bienvenido \e[1;34m"$current_user"\e[0m - Script Bash de instalación de recursos básicos tras la "
  echo " instalación de Sistemas Operativos GNU/Linux basados en Debian (Ubuntu - Mint) "
  echo "================================================================================"
  # Indicamos al usuario que comenzamos las tareas.
  echo
  echo "[Realizando tareas, espere un momento por favor (No cierre la terminal)...]"
  echo
  echo "Procesos restantes: "$proc
  # Tareas.
  #

  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt-get update &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt-get upgrade -y &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  # Google Chrome
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
  # Node
  # Update the repos for PPA:
  curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  #Yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  let "proc -= 1"
  echo "Procesos restantes: "$proc

  #
  apt install -y libstdc++6\
                 git \
                 curl \
		 wget \
		 vlc \
		 apt-transport-https \
		 yarn \
		 google-chrome-stable \
		 nodejs  &> $s_null

  snap install nvim --classic
  git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug

  let "proc -= 1"
  echo "Procesos restantes: "$proc
  apt-get autoremove -y &> $s_null #
  # Indicamos al usuario que hemos finalizado las tareas.
  echo
  echo "[Tareas finalizadas con éxito]"
  echo
  # Liberamos Variables.
  proc=
  s_null=
  current_user=
}}
# Limpiamos terminal de comandos ejecutados anteriormente.
clear
# Comprobamos que el fichero Bash ha sido ejecutado como SuperUsuario - root.
# En caso FALSE informamos al usuario de que ejecute de nuevo como root.
# En caso TRUE se llama a la función AiLinux.
if [ "$(id -u)" != "0" ]; then
   echo
   echo "============================================================================"
   echo "¡Este Script debe ejecutarse como SuperUsuario!" 1>&2
   echo "============================================================================"
   echo
    exit 1
else
  ailinux
    exit 1
fi

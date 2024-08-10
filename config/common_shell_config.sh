#!/bin/bash

# Control de historial y configuración de shell
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Control de errores
error_handler() {
  RED="\033[31m"
  RESET="\033[0m"
  BOLD="\033[1m"
  echo -e "${RED}${BOLD}Se ha producido un error en el script.${RESET}"
  # Aquí puedes agregar más acciones, como enviar notificaciones, limpiar recursos, etc.
}

# Atrapar errores (estado de salida distinto de cero)
trap 'error_handler' ERR

# Colores para el prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Si es xterm, establecer el título a user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# Habilitar colores en ls y grep si está disponible dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Cargar alias personalizados si existen
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Habilitar características de finalización programable si está disponible
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Cargar fzf si existe
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Obtener el nombre de usuario actual
_user="$(id -u -n)"

# Configuración de Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/home/$_user/.local/bin/virtualenv
source /home/$_user/.local/bin/virtualenvwrapper.sh

# Configuración del path de Java
export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))

# Configuración del path de Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/avd:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Función para cambiar o crear una rama
git_switch() {
  local branch_name=$1

  # Verificar si el nombre de la rama ha sido proporcionado
  if [ -z "$branch_name" ]; then
    echo "Por favor, proporciona el nombre de la rama."
    return 1
  fi

  # Verificar si la rama ya existe
  if git rev-parse --verify $branch_name >/dev/null 2>&1; then
    echo "La rama '$branch_name' ya existe. Cambiando a ella..."
    git switch $branch_name
  else
    echo "La rama '$branch_name' no existe. Creando y cambiando a ella..."
    git switch -c $branch_name
  fi
}

# Obtener el directorio actual
SCRIPT_DIR=$(pwd)

# Importar el archivo git_helpers.sh
source "$SCRIPT_DIR/git_helpers.sh"


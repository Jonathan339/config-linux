# Carga de aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Obtener el nombre de usuario actual
_user="$(id -u -n)"

# Configuración de Virtualenvwrapper:
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/home/$_user/.local/bin/virtualenv
source /home/$_user/.local/bin/virtualenvwrapper.sh
# # Configuración del path de Java
export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))

# Agregar el path de yarn global
# yarn_global_bin=$(yarn global bin)
# if [ -n "$yarn_global_bin" ]; then
#   export PATH="$PATH:$yarn_global_bin"
# fi

# Configuración del path de Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/avd
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Si viene de bash, podría ser necesario cambiar el $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path a la instalación de Oh-My-Zsh
export ZSH="/home/$_user/.oh-my-zsh"

ZSH_THEME="agnoster"

# Descomentar la siguiente línea para habilitar la autocompletado sensible a mayúsculas y minúsculas.
CASE_SENSITIVE="false"

# Descomentar la siguiente línea para cambiar la frecuencia de auto-actualización (en días).
export UPDATE_ZSH_DAYS=7
DISABLE_FZF_AUTO_COMPLETION="true"

# ¿Qué plugins deseas cargar?
# Los plugins estándar se encuentran en $ZSH/plugins/
# Los plugins personalizados pueden ser agregados a $ZSH_CUSTOM/plugins/
# Formato de ejemplo: plugins=(rails git textmate ruby lighthouse)
# Agrega sabiamente, ya que muchos plugins hacen más lento el inicio del shell.
plugins=(git virtualenvwrapper tmux zsh-interactive-cd sublime-merge themes fzf command-not-found autopep8)

# Incluir Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Incluir fzf si existe el archivo
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Habilitar autocompletado de fzf
autoload -U compinit && compinit


# Define una función para obtener el nombre del AVD de la lista de AVDs disponibles
function get_android_avd() {
  emulator -list-avds
}

# Define una función para lanzar el emulador de Android con el AVD seleccionado
function androidemulator() {
  local emulator_avd
  emulator_avd=$(get_android_avd)
  emulator -avd "$emulator_avd">/dev/null 2>&1
}

# Alias
alias code='which code | code .'
alias expo="yarn create expo-app"
alias android='yarn android && code .'
alias update='sudo apt update && sudo apt upgrade -y'
alias run-react='yarn react-native run-android && yarn react-native start'
alias ls='ls -G'
alias ll='ls -alG'
alias path='echo $PATH | tr ":" "\n" | nl'
alias tree='tree -I "node_modules" -L 4'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias gs='git status'
alias gp='git pull'
alias gpp='git push'
alias gc='git commit -am'

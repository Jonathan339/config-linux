# Carga de aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Obtener el nombre de usuario actual
_user="$(id -u -n)"

# Configuración de Virtualenvwrapper:
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_VIRTUALENV=/home/$_user/.local/bin/virtualenv
# source ~/.local/bin/virtualenvwrapper.sh

# Configuración del path de Java
export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))

# Agregar el path de yarn global
export PATH="$PATH:$(yarn global bin)"

# Configuración del path de Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
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

# ¿Qué plugins deseas cargar?
# Los plugins estándar se encuentran en $ZSH/plugins/
# Los plugins personalizados pueden ser agregados a $ZSH_CUSTOM/plugins/
# Formato de ejemplo: plugins=(rails git textmate ruby lighthouse)
# Agrega sabiamente, ya que muchos plugins hacen más lento el inicio del shell.
plugins=(git)

# Incluir Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Ejemplo de aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Incluir fzf si existe el archivo
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Habilitar autocompletado de fzf
autoload -U compinit && compinit

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

_user="$(id -u -n)"

#Virtualenvwrapper settings:
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_VIRTUALENV=/home/$_user/.local/bin/virtualenv
#source ~/.local/bin/virtualenvwrapper.sh

#java path
export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))
#export JAVA_HOME=$(which java)
#--------------------
#yarn global path

export PATH="$PATH:$(yarn global bin)"

#--------------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$_user/.oh-my-zsh"

ZSH_THEME="nanotech"


# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

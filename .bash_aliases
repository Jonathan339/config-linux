alias code='which code | code .'
alias expo="yarn create expo-app"

_emulator='$(emulator -list-avds)'
alias androidemulator='emulator -avd $_emulator'
alias update='sudo apt update && sudo apt upgrade -y'
alias run-react='yarn react-native run-android && yarn react-native start'
alias ls='ls -G'
alias ll='ls -alG'

alias path='echo $PATH | tr ":" "\n" | nl'
alias tree='tree -I 'node_modules' -L 4'


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

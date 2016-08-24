# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jesse/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path is set here
export PATH="$PATH:/bin:/usr/bin"

# Makes sure that aliases are autocompleted
setopt completealiases
# Keeps duplicated lines from appearing in the history file
setopt HIST_IGNORE_DUPS

autoload -Uz colors && colors

# Sourcing
#source ~/desktop/zsh-git-prompt/zshrc.sh
source ~/src/github/gh/bash/gh.bash

# Prompt
PROMPT="%{$fg[yellow]%}λ %{$fg[green]%}%c %{$fg[yellow]%}→ %{$reset_color%}%"

#Aliases
alias sus="systemctl suspend"
alias jc="javac -g"
alias pacman="sudo pacmatic"
alias ls="ls --color -F"
alias l="ls"
alias s="ls"
alias sl="ls"

# Exporting LANGUAGE variable
export LANGUAGE=en_US.UTF-8
export ANDROID_HOME=/opt/android-sdk
export BROWSER="firefox-developer"

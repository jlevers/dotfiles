# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jesse/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path is set here
export PATH="$PATH:/bin:/usr/bin:$HOME/.rvm/bin:$HOME/.gem/ruby/2.1.0/bin"

# Makes sure that aliases are autocompleted
setopt completealiases
# Keeps duplicated lines from appearing in the history file
setopt HIST_IGNORE_DUPS

autoload -U colors && colors

# Sourcing
source ~/desktop/zsh-git-prompt/zshrc.sh

# Prompt
PROMPT='%{$fg[yellow]%}λ %{$fg[green]%}%c %{$fg[yellow]%}→ $(git_super_status)%{$reset_color%}'

#Aliases
alias xrhoff="xrandr --output HDMI1 --off"
alias xrhon10="xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1"
alias xrhon16="xrandr --output HDMI1 --mode 1680x1050 --right-of LVDS1"
alias sus="systemctl suspend"
alias jc="javac -g"

# Exporting LANGUAGE variable
export LANGUAGE=en_US.UTF-8

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

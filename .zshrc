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
export PATH="/bin:/usr/bin:$HOME/.rvm/bin:$HOME/.gem/ruby/2.1.0/bin"

# Makes sure that aliases are autocompleted
setopt completealiases
# Keeps duplicated lines from appearing in the history file
setopt HIST_IGNORE_DUPS

autoload -U colors && colors

# Prompt
PROMPT="%{$fg[green]%}%n%{$fg[white]%}@%{$fg[red]%}%M %{$fg[yellow]%}%~ %{$fg[white]%}%#%{$reset_color%} "
RPROMPT="%{$fg[blue]%}%* %{$fg[white]%}[%{$fg[red]%}%?%{$fg[white]%}]%{$reset_color%}"

#Aliases
alias xrhoff="xrandr --output HDMI1 --off"
alias xrhon="xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1"

# Sourcing
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activating fish-like highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

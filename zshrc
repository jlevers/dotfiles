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
export PATH="$PATH:/bin:/usr/bin:~/.local/share/umake/bin/android-studio"

# Makes sure that aliases are autocompleted
setopt completealiases
# Keeps duplicated lines from appearing in the history file
setopt HIST_IGNORE_DUPS

autoload -Uz colors && colors

# Sourcing
source ~/src/github/gh/zsh/gh/gh.plugin.zsh

# Prompt
PROMPT="%{$fg[yellow]%}λ %{$fg[green]%}%c %{$fg[yellow]%}→ %{$reset_color%}%"

#Aliases
alias jc="javac -g"
alias apt="sudo apt"
alias ls="ls --color -F"
alias l="ls"
alias s="ls"
alias sl="ls"
alias vim='nvim'
#alias android-studio='~/.local/share/umake/bin/android-studio'

# Exporting LANGUAGE variable
export LANGUAGE=en_US.UTF-8
export ANDROID_HOME=/opt/android-sdk
export BROWSER="firefox"

export NVM_DIR="/home/jesse/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# CLI navigation commands reminder, from @Exuma on HN
function echo_color() {
  local color="$1"
  echo -e "${color}$2\e[0m"
}
echo_color "\e[38;5;4m" "C-f  Move forward"
echo_color "\e[38;5;4m" "C-b  Move backward"
echo_color "\e[38;5;4m" "C-p  Move up"
echo_color "\e[38;5;4m" "C-n  Move down"
echo_color "\e[38;5;4m" "C-a  Jump to beginning of line"
echo_color "\e[38;5;4m" "C-e  Jump to end of line"
echo_color "\e[38;5;4m" "C-d  Delete forward"
echo_color "\e[38;5;4m" "C-h  Delete backward"
echo_color "\e[38;5;4m" "C-k  Delete forward to end of line"
echo_color "\e[38;5;4m" "C-u  Delete entire line"

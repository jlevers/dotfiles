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
export PATH="$PATH:/bin:/usr/bin:~/.local/share/umake/bin/android-studio:/usr/lib/chromium-browser/"

# Makes sure that aliases are autocompleted
setopt completealiases
# Keeps duplicated lines from appearing in the history file
setopt HIST_IGNORE_DUPS

autoload -Uz colors && colors

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

PATH="/home/jesse/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/jesse/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jesse/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jesse/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jesse/perl5"; export PERL_MM_OPT;

# Sourcing
source ~/src/github/gh/zsh/gh/gh.plugin.zsh
source ~/src/catkin-ws/devel/setup.zsh


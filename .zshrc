# .zshrc
# Author: Piotr Karbowski <piotr.karbowski@gmail.com>
# License: beerware.

# Basic zsh config.
umask 077
ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
export EDITOR="/usr/bin/vim"
export TMP="$HOME/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"
export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin

# For RVM
source ~/.profile

if [ ! -d "${TMP}" ]; then mkdir "${TMP}"; fi

# Use hostname in TMUX_TMPDIR as $HOME may be on nfs.
export TMUX_TMPDIR="${TMPDIR}/tmux-${HOST}-${UID}"
if [ ! -d "${TMUX_TMPDIR}" ]; then mkdir -p "${TMUX_TMPDIR}"; fi

if ! [[ "${PATH}" =~ "^${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi

# Not all servers have terminfo for rxvt-256color. :<
if [ "${TERM}" = 'rxvt-256color' ] && ! [ -f '/usr/share/terminfo/r/rxvt-256color' ] && ! [ -f '/lib/terminfo/r/rxvt-256color' ] && ! [ -f "${HOME}/.terminfo/r/rxvt-256color" ]; then
	export TERM='rxvt-unicode'
fi

# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

# Functions
if [ -f '/etc/profile.d/prll.sh' ]; then
	. "/etc/profile.d/prll.sh"
fi

run_under_tmux() {
	# Run $1 under session or attach if such session already exist.
	# $2 is optional path, if no specified, will use $1 from $PATH.
	# If you need to pass extra variables, use $2 for it as in example below..
	# Example usage:
	# 	torrent() { run_under_tmux 'rtorrent' '/usr/local/rtorrent-git/bin/rtorrent'; }
	#	mutt() { run_under_tmux 'mutt'; }
	#	irc() { run_under_tmux 'irssi' "TERM='screen' command irssi"; }


	# There is a bug in linux's libevent...
	# export EVENT_NOEPOLL=1

	command -v tmux >/dev/null 2>&1 || return 1

	if [ -z "$1" ]; then return 1; fi
	local name="$1"
	if [ -n "$2" ]; then
		local file_path="$2"
	else
		local file_path="command ${name}"
	fi

	if tmux has-session -t "${name}" 2>/dev/null; then
		tmux attach -d -t "${name}"
	else
		tmux new-session -s "${name}" "${file_path}" \; set-option status \; set set-titles-string "${name} (tmux@${HOST})"
	fi
}

t() { run_under_tmux rtorrent; }
irc() { run_under_tmux irssi "TERM='screen' command irssi"; }

over_ssh() {
	if [ -n "${SSH_CLIENT}" ]; then
		return 0
	else
		return 1
	fi
}

reload () {
          exec "${SHELL}" "$@"
}

escape_string() {
	# Uber useful when you need to translate weird as fuck path into single-argument string.
	local escape_string_input
	echo -n "String to escape: "
	read escape_string_input
	_escaped_string="$(printf '%q' "$escape_string_input")"
	if [ "$1" = '-o' ]; then
		echo
		echo "${_escaped_string}"
		echo
	else
		export _escaped_string
		echo "Escaped string has been pushed to \${_escaped_string} variable." 1>&2
	fi
}

confirm() {
	local answer
	echo -ne "zsh: sure you want to run '${YELLOW}$@${NC}' [yN]? "
	read -q answer
		echo
	if [[ "${answer}" =~ ^[Yy]$ ]]; then
		command "${=1}" "${=@:2}"
	else
		return 1
	fi
}

confirm_wrapper() {
	if [ "$1" = '--root' ]; then
		local as_root='true'
		shift
	fi

	local runcommand="$1"; shift

	if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
		runcommand="sudo ${runcommand}"
	fi
	confirm "${runcommand}" "$@"
}

poweroff() { confirm_wrapper --root $0 "$@"; }
reboot() { confirm_wrapper --root $0 "$@"; }
hibernate() { confirm_wrapper --root $0 "$@"; }

detox() {
	if [ "$#" -ge 1 ]; then
		confirm detox "$@"
	else	
		command detox "$@"
	fi
}

has() {
	local string="${1}"
	shift
	local element=''
	for element in "$@"; do
		if [ "${string}" = "${element}" ]; then
			return 0
		fi
	done
	return 1
}

begin_with() {
	local string="${1}"
	shift
	local element=''
	for element in "$@"; do
		if [[ "${string}" =~ "^${element}" ]]; then
			return 0
		fi
	done
	return 1

}

termtitle() {
	case "$TERM" in
		rxvt*|xterm|nxterm|gnome|screen|screen-*)
			local prompt_host="${(%):-%m}"
			local prompt_user="${(%):-%n}"
			local prompt_char="${(%):-%~}"
			case "$1" in
				precmd)
					printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
				;;
				preexec)
					printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
				;;
			esac
		;;
	esac
}

git_check_if_worktree() {
	# This function intend to be only executed in chpwd().
	# Check if the current path is in git repo.	

	# We would want stop this function, on some big git repos it can take some time to cd into.
	if [ -n "${skip_zsh_git}" ]; then
		git_pwd_is_worktree='false'
		return 1
	fi
	# The : separated list of paths where we will run check for git repo.
	# If not set, then we will do it only for /root and /home.
	if [ "${UID}" = '0' ]; then
		# running 'git' in repo changes owner of git's index files to root, skip prompt git magic if CWD=/home/*
		git_check_if_workdir_path="${git_check_if_workdir_path:-/root:/etc}"
	else
		git_check_if_workdir_path="${git_check_if_workdir_path:-/home}"
		git_check_if_workdir_path_exclude="${git_check_if_workdir_path_exclude:-${HOME}/_sshfs}"
	fi

	if begin_with "${PWD}" ${=git_check_if_workdir_path//:/ }; then
		if ! begin_with "${PWD}" ${=git_check_if_workdir_path_exclude//:/ }; then
			local git_pwd_is_worktree_match='true'
		else
			local git_pwd_is_worktree_match='false'
		fi
	fi

	if ! [ "${git_pwd_is_worktree_match}" = 'true' ]; then
		git_pwd_is_worktree='false'
		return 1
	fi

	# todo: Prevent checking for /.git or /home/.git, if PWD=/home or PWD=/ maybe...
	#	damn annoying RBAC messages about Access denied there.
	if [ -d '.git' ] || [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
		git_pwd_is_worktree='true'
		git_worktree_is_bare="$(git config core.bare)"
	else
		unset git_branch git_worktree_is_bare
		git_pwd_is_worktree='false'
	fi
}

git_branch() {
	git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
	git_branch="${git_branch##*/}"
	git_branch="${git_branch:-no branch}"
}

git_dirty() {
	if [ "${git_worktree_is_bare}" = 'false' ] && [ -n "$(git status --untracked-files='no' --porcelain)" ]; then
		git_dirty='%F{green}*'
	else
		unset git_dirty
	fi
}

precmd() {
	# Set terminal title.
	termtitle precmd

	if [ "${git_pwd_is_worktree}" = 'true' ]; then
		git_branch
		git_dirty

		git_prompt=" %F{blue}[%F{253}${git_branch}${git_dirty}%F{blue}]"
	else
		unset git_prompt
	fi

# Maybe to be used someday, too annoying with vim and other interactive apps.
#	# $REPORTTIME is about cpu time, not real time.
#	if [ "${executed_on}" ]; then
#		local current_timestamp=${(%):-'%D{%s}'}
#		local last_cmd_took=$(( current_timestamp - executed_on ))
#		if [ "${last_cmd_took}" -gt 60 ]; then
#			printf "\n>>> [INFO] Execution took %ss\n\n" "$last_cmd_took"
#		fi
#		unset executed_on
#	fi
}

preexec() {
	# Set terminal title along with current executed command pass as second argument
	termtitle preexec "${(V)1}"

#	# Save timestamp when we executed this command
#	executed_on=${(%):-'%D{%s}'}
}

chpwd() {
	git_check_if_worktree
}

man() {
	if command -v vimmanpager >/dev/null 2>&1; then
		PAGER="vimmanpager" command man "$@"
	else
		command man "$@"
	fi
}

# Are we running under grsecurity's RBAC?
rbac_auth() {
	local auth_to_role='admin'
	if [ "${USER}" = 'root' ]; then
		if ! grep -qE '^RBAC:' "/proc/self/status" && command -v gradm > /dev/null 2>&1; then
			echo -e "\n${BLUE}*${NC} ${GREEN}RBAC${NC} Authorize to '${auth_to_role}' RBAC role."
			gradm -a "${auth_to_role}" && exec "${SHELL}" "$@"
		fi
	fi
}
#rbac_auth

# Check if we started zsh in git worktree, useful with tmux when your new zsh may spawn in source dir.
git_check_if_worktree
if [ "${git_pwd_is_worktree}" = 'true' ]; then
	git_branch
	git_dirty
	git_prompt=" %F{blue}[%F{253}${git_branch}${git_dirty}%F{blue}]"
else
	unset git_prompt
fi


# Le features!
# extended globbing, awesome!
setopt extendedGlob

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Control-x-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Include user-specified configs.
if [ ! -d "${ZSHDDIR}" ]; then
	mkdir -p "${ZSHDDIRimport XMonad
import XMonad hiding (Tall)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.LayoutHints
import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid  
import XMonad.Actions.CycleWS  
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.Run(spawnPipe)
import System.Exit
import System.IO
import Data.Monoid
import XMonad.Layout.Grid  
import XMonad.Actions.GridSelect
import XMonad.Layout.Tabbed
import XMonad.Layout.SimplestFloat
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
urgentColor = ("#8787af", "")
currentColor = ("#87afd7", "")

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook
           $ defaultConfig {
                terminal           = "urxvt",
                modMask            = mod4Mask,
                workspaces         = ["[1]:[pr0n]", "[2]:[irc]", "[3]:[code]", "[4]:[terms]", "[5]:[porr]", "[6]", "[7]", "[8]", "[9]:[music]"],
                normalBorderColor  = "#202020",
                focusedBorderColor = "#8787af",
				manageHook         = myManageHook,
                keys               = myKeys,
                mouseBindings      = myMouseBindings,
                layoutHook         = myLayout,
                logHook            = dynamicLogWithPP $ xmobarPP { 
                                         ppOutput = hPutStrLn xmproc,
										 ppCurrent = xmobarColor (fst currentColor) (snd currentColor),
                                         ppTitle = xmobarColor "#ffaf5f" "" . shorten 150
                                     }
    }
 
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    [ ((mod1Mask              , xK_Return   ), spawn $ XMonad.terminal conf)
    , ((mod1Mask .|. shiftMask, xK_c        ), kill)
    , ((mod1Mask              , xK_space    ), sendMessage NextLayout)
    , ((mod1Mask .|. shiftMask, xK_space    ), setLayout $ XMonad.layoutHook conf)
    , ((modMask              , xK_n        ), refresh)
    , ((mod1Mask              , xK_Tab      ), windows W.focusDown)
    , ((mod1Mask              , xK_j        ), windows W.focusDown)
    , ((mod1Mask              , xK_k        ), windows W.focusUp)
    , ((mod1Mask              , xK_m        ), windows W.focusMaster)
    , ((mod1Mask .|. shiftMask, xK_Return   ), windows W.swapMaster)
    , ((mod1Mask .|. shiftMask, xK_j        ), windows W.swapDown)
    , ((mod1Mask .|. shiftMask, xK_k        ), windows W.swapUp)
    , ((mod1Mask              , xK_g        ), goToSelected defaultGSConfig)
    , ((mod1Mask              , xK_h        ), sendMessage Shrink)
    , ((mod1Mask              , xK_l        ), sendMessage Expand)
    , ((mod1Mask .|. shiftMask, xK_h        ), sendMessage MirrorShrink)
    , ((mod1Mask .|. shiftMask, xK_l        ), sendMessage MirrorExpand)
    , ((mod1Mask              , xK_t        ), withFocused $ windows . W.sink)
    , ((mod1Mask              , xK_i        ), sendMessage (IncMasterN 1))
    , ((mod1Mask              , xK_d        ), sendMessage (IncMasterN (-1)))
    , ((mod1Mask .|. shiftMask, xK_q        ), io (exitWith ExitSuccess))
    , ((mod4Mask              , xK_q        ), spawn "xmonad --recompile; xmonad --restart")
    , ((mod1Mask              , xK_p       ), shellPrompt defaultXPConfig)
    , ((0                    , 0x1008ff13  ), spawn "amixer -q set Master 2dB+")
    , ((0                    , 0x1008ff11  ), spawn "amixer -q set Master 2dB-")
    , ((0                    , 0x1008ff12  ), spawn "amixer -q set Master toggle")
    , ((0                    , 0x1008ff16  ), spawn "mocp --prev")
    , ((0                    , 0x1008ff17  ), spawn "mocp --next")
    , ((0                    , 0x1008ff14  ), spawn "mocp --toggle-pause")
    , ((mod1Mask              , xK_Print    ), spawn "scrot -e 'mv $f ~/Screenshots'")
    ]
    ++
 
    [((m .|. mod1Mask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
 
    ++
 
    [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((mod1Mask, button1), (\w -> focus w >> mouseMoveWindow w
                                          >> windows W.shiftMaster))
    , ((mod1Mask, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((mod1Mask, button3), (\w -> focus w >> mouseResizeWindow w
                                          >> windows W.shiftMaster))
    ]
 
myLayout = avoidStruts $ layoutHints (simpleTabbed ||| tall ||| simplestFloat ||| Mirror tall ||| Full)
  where
     tall = ResizableTall nmaster delta ratio []
     nmaster = 1
     delta   = 3/100
     ratio   = 1/2
 
myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "mplayer2"    --> doShift "1:pr0n"
    , className =? "Firefox" --> doShift "2:irc"]}" && echo "# Put your user-specified config here." > "${ZSHDDIR}/example.zsh"
fi

for zshd in $(ls -A ${HOME}/.config/zsh.d/^*.(z)sh$); do
	. "${zshd}"
done

# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# If running as root and nice >0, renice to 0.
if [ "$USER" = 'root' ] && [ "$(cut -d ' ' -f 19 /proc/$$/stat)" -gt 0 ]; then
	renice -n 0 -p "$$" && echo "# Adjusted nice level for current shell to 0."
fi

# Fancy prompt.
if over_ssh && [ -z "${TMUX}" ]; then
	prompt_is_ssh='%F{blue}[%F{red}SSH%F{blue}] '
elif over_ssh; then
	prompt_is_ssh='%F{blue}[%F{253}SSH%F{blue}] '
else
	unset prompt_is_ssh
fi

case $USER in
	root)
		PROMPT='%B%F{cyan}%m%k %(?..%F{blue}[%F{253}%?%F{blue}] )${prompt_is_ssh}%B%F{blue}%1~${git_prompt}%F{blue} %# %b%f%k'
	;;

	*)	
		PROMPT='%B%F{blue}%n@%m%k %(?..%F{blue}[%F{253}%?%F{blue}] )${prompt_is_ssh}%B%F{cyan}%1~${git_prompt}%F{cyan} %# %b%f%k'

	;;
esac

# Ignore lines prefixed with '#'.
setopt interactivecomments

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol

# Fix for tmux on linux.
case "$(uname -o)" in
	'GNU/Linux')
		export EVENT_NOEPOLL=1
	;;
esac

# Aliases
alias cp='cp -iv'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"

if command -v colordiff > /dev/null 2>&1; then
	alias diff="colordiff -Nuar"
else
	alias diff="diff -Nuar"
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'


# Keys.
case $TERM in
	rxvt*|xterm*)
		bindkey "^[[7~" beginning-of-line #Home key
		bindkey "^[[8~" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[[A" history-beginning-search-backward #Up Arrow
		bindkey "^[[B" history-beginning-search-forward #Down Arrow
		bindkey "^[Oc" forward-word # control + right arrow
		bindkey "^[Od" backward-word # control + left arrow
		bindkey "^H" backward-kill-word # control + backspace
		bindkey "^[[3^" kill-word # control + delete
	;;

	linux)
		bindkey "^[[1~" beginning-of-line #Home key
		bindkey "^[[4~" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[[A" history-beginning-search-backward
		bindkey "^[[B" history-beginning-search-forward
	;;

	screen|screen-*)
		bindkey "^[[1~" beginning-of-line #Home key
		bindkey "^[[4~" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[[A" history-beginning-search-backward #Up Arrow
		bindkey "^[[B" history-beginning-search-forward #Down Arrow
		bindkey "^[Oc" forward-word # control + right arrow
		bindkey "^[Od" backward-word # control + left arrow
		bindkey "^H" backward-kill-word # control + backspace
		bindkey "^[[3^" kill-word # control + delete
	;;
esac

bindkey "^R" history-incremental-pattern-search-backward 
bindkey "^S" history-incremental-pattern-search-forward

if [ -f ~/.alert ]; then echo '>>> Check ~/.alert'; fi
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
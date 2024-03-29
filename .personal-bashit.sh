#!/usr/bin/env bash
# ---------------------------------------------
# Artifact:     rc/rc
# Version:      0.1.0
# Date (UTC):   Mon, 23 Jan 2023 10:29:21 +0000
# Generated by: bashing 0.2.2
# ---------------------------------------------
export __BASHING_VERSION='0.2.2'
export __VERSION='0.1.0'
export __ARTIFACT_ID='rc'
export __GROUP_ID='rc'
if [[ ! -z $BASH_VERSION ]]; then
    export CURRENT_SHELL=bash
else
    export CURRENT_SHELL=zsh
fi
sourceFiles() {
    if [ -d $1 ]; then
        find $1 -maxdepth 1 -type f -print | egrep '\.sh$|\.bash$|.zsh$' | while read FILE; do
            source $FILE
        done
    fi
}
_command_exists() {
    command -v $1 >/dev/null
}
_path_prepend() {
    if [ -n "$2" ]; then
        case ":$(eval "echo \$$1"):" in
            *":$2:"*) :;;
            *) eval "export $1=$2\${$1:+\":\$$1\"}" ;;
        esac
    else
        case ":$PATH:" in
            *":$1:"*) :;;
            *) export PATH="$1${PATH:+":$PATH"}" ;;
        esac
    fi
}
_path_append() {
    if [ -n "$2" ]; then
        case ":$(eval "echo \$$1"):" in
            *":$2:"*) :;;
            *) eval "export $1=\${$1:+\"\$$1:\"}$2" ;;
        esac
    else
        case ":$PATH:" in
            *":$1:"*) :;;
            *) export PATH="${PATH:+"$PATH:"}$1" ;;
        esac
    fi
}
[[ ! -z $_RC_DEBUG ]] && echo "Setting CURRENT_SHELL=$CURRENT_SHELL"
[[ $CURRENT_SHELL == bash ]] && [[ -f $HOME/.bashrc.d/flatpak_aliases ]] && source $HOME/.bashrc.d/flatpak_aliases
alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias cd..='cd ..'       # Common misspelling for going up one directory
alias -- -='cd -'        # Go back
alias cnc='grep "^[^#;]"'
alias cpuu="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias dud='du -h --max-depth=1 --one-file-system'
alias dudg='du -h --max-depth=1 --one-file-system 2>&1 | egrep "^[0-9.]*G"'
alias hg='history | grep --colour=auto'
alias grep="grep --color --exclude-dir='.svn' --exclude-dir='.git'"
alias hc="history | cut -b 8-"
alias l.='ls -d .[a-zA-Z]* --color=tty'
alias l='ls -l --color=tty'
alias ll='ls -la --color=tty'
alias s='kitty +kitten ssh'
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
  alias ls="command ls ${colorflag}"
fi
alias l="ls -lF ${colorflag}"
alias la="ls -lAF ${colorflag}"
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
alias md='mkdir'
alias memu='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias psi='ps h -eo pmem,comm | sort -nr | head'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias _="sudo"
alias vbrc="vim ~/.bashrc"
alias vbpf="vim ~/.bash_profile"
if which gshuf &> /dev/null
then
  alias shuf=gshuf
fi
alias h='history'
alias md='mkdir -p'
alias rd='rmdir'
alias psa='ps aux | cut -b -180'
alias psag='ps aux | cut -b -180 | grep'
alias ssh-ports-open="nmap -T4 -F 192.168.0.10-254 --min-parallelism=20 -oG - | grep 22/open"
alias pbcopy="xclip -selection clipboard"
[[ ! -z $_RC_DEBUG ]] && echo "Initialized aliases.sh"
if [[ $CURRENT_SHELL == bash ]]; then
    shopt -s histverify
    shopt -s cdspell
    shopt -s nocaseglob
    shopt -s cmdhist
    [[ ! -z $_RC_DEBUG ]] && echo "Initialized bash-options.sh"
fi
_command_exists direnv && eval "$(direnv hook $CURRENT_SHELL)"
[[ -d ""$HOME/.dotbare"" ]] && ! _command_exists dotbare && source "$HOME/.dotbare"/dotbare.plugin.$CURRENT_SHELL
[[ ! -z $_RC_DEBUG ]] && echo "Initialized dotbare.sh"
export GPG_TTY=$(tty)
export PIPENV_VENV_IN_PROJECT=1
if [ -z $(which lvim) ]; then
    export EDITOR=vim
else
    export EDITOR=lvim
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized environment.sh"
mkcd() {
    [ -n "$1" ] && mkdir -p "$@" && cd "$1";
}
rustscan() {
    /snap/bin/rustscan -g $@
}
rsyncFolder() {
    mkdir -p "$2"
    rsync -avrmR --exclude='node_modules/' --exclude='.tmp/' --exclude='.git/' --exclude='.webpack/' --exclude='.serverless/' --exclude='coverage/' --exclude='.history/' $@
}
[[ ! -z $_RC_DEBUG ]] && echo "Initialized functions.sh"
github-install() {
	if [ "$1" == "" ]; then
		echo "usage: github-install <user>/<repo>@<release>"
		return
	fi
	pushd $HOME/bin > /dev/null
	curl https://i.jpillora.com/$1?type=script | bash
	popd > /dev/null
}
[[ ! -z $_RC_DEBUG ]] && echo "Initialized github-install.sh"
if [[ -n "$GOENV_ROOT" && -x "$GOENV_ROOT/bin/goenv" ]] || [[ -x "$HOME/.goenv/bin/goenv" ]]; then
    if ! _command_exists goenv; then
        export GOENV_ROOT="${GOENV_ROOT:-$HOME/.goenv}"
        ! _command_exists goenv && [[ -x "$GOENV_ROOT/bin/goenv" ]] && _path_prepend "$GOENV_ROOT/bin"
        eval "$(goenv init - $CURRENT_SHELL)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized goenv.sh"
if [[ -n "$JENV_ROOT" && -x "$JENV_ROOT/bin/jenv" ]] || [[ -x "$HOME/.jenv/bin/jenv" ]]; then
    if ! _command_exists jenv; then
        export JENV_ROOT="${JENV_ROOT:-$HOME/.jenv}"
        ! _command_exists jenv && [[ -x "$JENV_ROOT/bin/jenv" ]] && _path_prepend "$JENV_ROOT/bin"
        eval "$(jenv init - $CURRENT_SHELL)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized jenv.sh"
if [[ "$(id -u)" -ne 0 ]]; then
    if [[ -z $LAH_FOLDER ]]; then
        [[ ! -z $_RC_DEBUG ]] && echo "Initializing log-all-history for $CURRENT_SHELL"
        export LAH_FOLDER=${LAH_FOLDER:-${HOME}/.logs}
        [ -d $LAH_FOLDER ] || mkdir -p $LAH_FOLDER
        hdgrep() {
            WHERE="$LAH_FOLDER/$(pwd)"
            grep -Rh $@ $WHERE
        }
        hgrep() {
            WHERE="$LAH_FOLDER"
            grep -Rh $@ $WHERE
        }
    fi
fi
if [[ -d $HOME/.nodenv ]]; then
    if ! _command_exists nodenv; then
        export NODENV_ROOT="$HOME/.nodenv"
        _path_prepend "$NODENV_ROOT/bin"
        eval "$(nodenv init - $CURRENT_SHELL)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized nodenv.sh"
[[ -d $HOME/.autojump/bin ]] && _path_append $HOME/.autojump/bin
[[ -d $HOME/bin ]] && _path_prepend $HOME/bin
[[ -d $HOME/.local/bin ]] && _path_prepend $HOME/.local/bin
[[ -d /snap/bin ]] && _path_append /snap/bin
[[ -d $HOME/go/bin ]] && _path_append $HOME/go/bin
[[ ! -z $_RC_DEBUG ]] && echo "Initialized paths.sh"
if [ -d $HOME/.private ]; then
	sourceFiles $HOME/.private/
fi
if [[ -n "$PYENV_ROOT" && -x "$PYENV_ROOT/bin/pyenv" ]] || [[ -x "$HOME/.pyenv/bin/pyenv" ]]; then
    if ! _command_exists pyenv; then
        export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
        _path_prepend "$PYENV_ROOT/bin"
        eval "$(pyenv init -)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized pyenv.sh"
if [[ -d $HOME/.1password ]]; then
  export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
else
  eval `ssh-agent`
  [[ -d $HOME/.ssh ]] && [[ $(find $HOME/.ssh | egrep 'id_.*pub' | wc -l) -gt 0 ]] && [[ $(ssh-add -L | wc -l) == 0 ]] && ssh -a $HOME/.ssh/*pub
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized pyenv.sh"
if [[ $CURRENT_SHELL == bash ]] && [[ "$(id -u)" -ne 0 ]]; then
log() { printf '%s\n' "$*"; }
error() { log "ERROR: $*" >&2; }
fatal() { error "$@"; exit 1; }
trap_add() {
    trap_add_cmd=$1; shift || fatal "${FUNCNAME} usage error"
    for trap_add_name in "$@"; do
        trap -- "$(
            extract_trap_cmd() { printf '%s\n' "$3"; }
            eval "extract_trap_cmd $(trap -p "${trap_add_name}")"
            printf '%s\n' "${trap_add_cmd}"
        )" "${trap_add_name}" \
            || fatal "unable to add to trap ${trap_add_name}"
    done
}
function detailed_hist() {
    [ "$(id -u)" -eq 0 ] && return
    NOW=$(date "+%Y-%m-%d")
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
    local THIS_COMMAND=`history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`;
    [ "$THIS_COMMAND" = "$LAST_COMMAND" ] && return # Don't log the same command multiple times
    LAST_COMMAND="$THIS_COMMAND"
    DEST="${LAH_FOLDER}$(pwd)"
    [ ! -d "$DEST" ] && mkdir -p "$DEST"
    echo "$(date "+%Y-%m-%d.%H:%M:%S") $THIS_COMMAND" >> "$DEST/bash-history-$NOW.log"
    history -a; history -c; history -r
}
declare -f -t trap_add
LAST_COMMAND=
trap_add 'detailed_hist' DEBUG
[[ ! -z $_RC_DEBUG ]] && echo "Initialized log-all-history functions for bash"
fi
if [[ $CURRENT_SHELL == zsh ]] && [[ "$(id -u)" -ne 0 ]]; then
_open_cmd_log() {
    local NOW=$(date "+%Y-%m-%d")
    local DEST_DIR="${LAH_FOLDER}$(pwd)"
    [[ -d $DEST_DIR ]] || mkdir -p $DEST_DIR
    local DEST="${DEST_DIR}/zsh-history-$NOW.log"
    if [[ $_LAH_LAST_FOLDER != $DEST ]]; then
        [[ ! -z $LAH_DEBUG ]] && echo "Closing _cmd_log_fd since folder changing"
        exec {_cmd_log_fd}<&-
        _LAH_STATE="closed"
    fi
    if [[ $_LAH_STATE == "closed" ]]; then
        [[ ! -z $LAH_DEBUG ]] && echo "Opening _cmd_log_fd to $DEST"
        sysopen -a -m 600 -o cloexec,creat -u _cmd_log_fd "$DEST" 2>/dev/null
        if (( $? )); then
            _cmd_log_fd=-1
            echo "Error in log-all-history plugin.  error $? opening $DEST"
        else
            _LAH_STATE="open"
            _LAH_LAST_FOLDER=$DEST
        fi
    fi
}
_detailed_hist() {
    _open_cmd_log
    if (( _cmd_log_fd >= 0 )); then
        print -r -- "${(%):-%D{%Y-%m-%d.%H:%M:%S\}} $3" >&$_cmd_log_fd
    fi
}
if [[ -z $_LAH_STATE ]]; then
    [[ ! -z $LAH_DEBUG ]] && echo "Initializing log-all-history plugin"
    zmodload zsh/system
    typeset -gi _cmd_log_fd
    _LAH_STATE="closed"
    _LAH_LAST_FOLDER=""
fi
autoload -Uz add-zsh-hook
add-zsh-hook preexec _detailed_hist
[[ ! -z $_RC_DEBUG ]] && echo "Initialized log-all-history functions for zsh"
fi
function cli_bashit() {
  export BASH_IT=${BASH_IT:-$HOME/.bash_it}
  export BASH_IT_THEME=${BASH_IT_THEME:-"powerline-multiline"}
  [[ -z $SHORT_USER ]] && export SHORT_USER="$(hostname -s)@${USER:0:8}"
  export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
  source "$BASH_IT"/bash_it.sh
  return 0;
}
function cli_bash() {
  return 0;
}
function cli_ohmyzsh() {
  export ZSH="$HOME/.oh-my-zsh"
  plugins=(git ag aliases autojump aws colored-man-pages command-not-found direnv docker docker-compose fd gcloud gpg-agent \
      history-substring-search ssh-agent pip pyenv rbenv rsync yarn \
      log-all-history private personal dotbare)
  zstyle ':omz:update' mode reminder  # just remind me to update when it's time
  zstyle ':omz:update' frequency 13
  source $ZSH/oh-my-zsh.sh
  return 0;
}
function cli_zprezto() {
  return 0;
}
function __run() {
  local pid=""
  local status=255
  local cmd="${1-}"
  shift || true
  case "$cmd" in
    "bashit") cli_bashit "$@" & local pid="$!";;
    "bash") cli_bash "$@" & local pid="$!";;
    "ohmyzsh") cli_ohmyzsh "$@" & local pid="$!";;
    "zprezto") cli_zprezto "$@" & local pid="$!";;
    "help")
      echo "Usage: rc <task> [...]" 1>&2
      cat 1>&2 <<HELP

    bashit   :  Start bash using bash-it
    bash     :  (no help available)
    help     :  display this help message
    ohmyzsh  :  (no help available)
    version  :  display version
    zprezto  :  (no help available)

HELP
      status=0
      ;;
    "version")
      echo "rc 0.1.0 (bash $BASH_VERSION)"
      status=0
      ;;
    *) echo "Unknown Command: $cmd" 1>&2;;
  esac
  if [ ! -z "$pid" ]; then
      wait "$pid"
      local status=$?
  fi
  return $status
}
cli_bashit

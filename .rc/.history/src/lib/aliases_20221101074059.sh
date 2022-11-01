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
alias gh='history | grep --colour=auto'
alias grep="grep --color --exclude-dir='.svn' --exclude-dir='.git'"
alias hc="history | cut -b 8-"
alias l.='ls -d .[a-zA-Z]* --color=tty'
alias l='ls -l --color=tty'
alias ll='ls -la --color=tty'
alias s='kitty +kitten ssh'


alias scp='BINARY_SSH=scp /path/to/repassh'
alias rsync='BINARY_SSH=rsync /path/to/repassh'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'

  # Always use color output for `ls`
  alias ls="command ls ${colorflag}"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

alias md='mkdir'
alias memu='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias psi='ps h -eo pmem,comm | sort -nr | head'

alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

alias _="sudo"

# Shortcuts to edit startup files
alias vbrc="vim ~/.bashrc"
alias vbpf="vim ~/.bash_profile"

if which gshuf &> /dev/null
then
  alias shuf=gshuf
fi

# Shell History
alias h='history'

# Directory
alias md='mkdir -p'
alias rd='rmdir'

alias psa='ps aux | cut -b -180'
alias psag='ps aux | cut -b -180 | grep'

alias ssh-ports-open="nmap -T4 -F 192.168.0.10-254 --min-parallelism=20 -oG - | grep 22/open"

[[ ! -z $_RC_DEBUG ]] && echo "Initialized aliases.sh"

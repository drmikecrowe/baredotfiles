#!/usr/bin/env bash

alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias cd..='cd ..'       # Common misspelling for going up one directory
alias -- -='cd -'        # Go back
alias acs='apt-cache search'
alias acs='aptitude search'
alias agg='sudo aptitude upgrade'
alias agi='aptitude install'
alias agi='sudo aptitude install'
alias agr='sudo aptitude remove'
alias agu='sudo aptitude update'
alias cnc='grep "^[^#;]"'
alias copy='cp'
alias cpuu="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias dir='ls'
alias dud='du -h --max-depth=1 --one-file-system'
alias dudg='du -h --max-depth=1 --one-file-system 2>&1 | egrep "^[0-9.]*G"'
alias gh='history | grep --colour=auto'
alias grep="grep --color --exclude-dir='.svn' --exclude-dir='.git'"
alias hc="history | cut -b 8-"
alias l.='ls -d .[a-zA-Z]* --color=tty'
alias l='ls -l --color=tty'
alias ll='ls -la --color=tty'
alias ls='ls --color=tty'
alias lsd='ls -l | grep ^d'
alias md='mkdir'
alias memu='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias psa='ps faux'
alias psag='ps faux | grep'
alias psg='ps -A | grep'
alias psi='ps h -eo pmem,comm | sort -nr | head'
alias tail='tail -n 30'

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

alias npm-r="npm run"
alias npm-i="npm install"
alias npm-i-force="rm -rf node_modules && rm package-lock.json && npm-i"
alias npm-dep="npm install --save"
alias npm-dev="npm install --save-dev"
alias npm-global="npm install --global"
alias npm-u="npm uninstall"
alias npm-s="npm repo"

alias pnpm-r="pnpm run"
alias pnpm-i="pnpm install --child-concurrency=8"
alias pnpm-i-force="rm -rf node_modules && rm shrinkwrap.yaml && pnpm-i"
alias pnpm-dep="pnpm install --save"
alias pnpm-dev="pnpm install --save-dev"
alias pnpm-global="pnpm install --global"
alias pnpm-u="pnpm uninstall"
alias pnpm-s="npm repo"

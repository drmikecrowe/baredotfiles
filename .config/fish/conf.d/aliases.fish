alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias cnc='grep "^[^#;]"'
alias dud='du -h --max-depth=1 --one-file-system'
alias dudg='du -h --max-depth=1 --one-file-system 2>&1 | egrep "^[0-9.]*G"'
alias grep="grep --color --exclude-dir='.svn' --exclude-dir='.git'"
alias tail='tail -n 30'
alias hc="history show all | grep -v EOF"
alias dotbare="~/.dotbare/dotbare"

alias ls="ls -FG"
alias l="ls -FGl --color"
alias psa='ps faux'
alias ssh-open-ports="nmap -T4 -F 192.168.12.1-254 -oG - | grep 22/open | sed 's/Ports:.*//'"

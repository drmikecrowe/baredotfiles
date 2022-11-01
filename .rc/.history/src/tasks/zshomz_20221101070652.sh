export ZSH="$HOME/.oh-my-zsh"

plugins=(git ag aliases autojump aws colored-man-pages command-not-found direnv docker docker-compose fd gcloud gpg-agent \
    history-substring-search ssh-agent pip pyenv rbenv rsync yarn \
    log-all-history private personal dotbare)

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13

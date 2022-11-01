# Source Prezto.

plugins=(git ag aliases autojump aws colored-man-pages command-not-found direnv docker docker-compose fd gcloud gpg-agent \
    history-substring-search ssh-agent pip pyenv rbenv rsync yarn \
    log-all-history private personal dotbare)


if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

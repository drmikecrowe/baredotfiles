[[ -d ""$HOME/.dotbare"" ]] && ! _command_exists dotbare && source "$HOME/.dotbare"/dotbare.plugin.$CURRENT_SHELL
[[ ! -z $_RC_DEBUG ]] && echo "Initialized dotbare.sh"

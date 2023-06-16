if not status --is-interactive
	exit
end
set -gx ATUIN_NOBIND "true"
atuin init fish | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search

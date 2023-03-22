for i in ~/bin /usr/local/bin ~/.local/bin /snap/bin ~/go/bin 
    if [ -d $i ]
        if not contains $i $PATH
            set PATH $PATH $i
        end
    end
end

if [ -d ~/.deno ]
    set -gx DENO_INSTALL $HOME/.deno
    set PATH $PATH $DENO_INSTALL/bin
end

if [ -d ~/.nodenv ]
    if not contains $HOME/.nodenv $PATH
        set -Ux NODENV_ROOT $HOME/.nodenv
        set -U fish_user_paths $NODENV_ROOT/bin $fish_user_paths
    end
    status --is-interactive; and source (nodenv init -|psub)
end

if [ -d ~/.pyenv ]
    if not contains $HOME/.pyenv $PATH
        set -Ux PYENV_ROOT $HOME/.pyenv
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    end
    pyenv init - | source    
end

if [ -d ~/.goenv ]
    if not contains $HOME/.goenv $PATH
        set -Ux GOENV_ROOT $HOME/.goenv
        set -U fish_user_paths $GOENV_ROOT/bin $fish_user_paths
    end
    status --is-interactive; and source (goenv init -|psub)
end

set -gx SSH_AUTH_SOCK $HOME/.1password/agent.sock
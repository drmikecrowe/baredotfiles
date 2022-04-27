contains $HOME/bin 
or set -gx PATH  $HOME/bin $PATH
contains $HOME/.nodenv/bin $PATH 
or set -gx PATH  $HOME/.nodenv/bin $PATH
contains $HOME/.pyenv/bin $PATH 
or set -gx PATH  $HOME/.pyenv/bin $PATH
contains $HOME/.goenv/bin $PATH 
or set -gx PATH  $HOME/.goenv/bin $PATH
contains $HOME/.local/bin $PATH 
or set -gx PATH  $HOME/.local/bin $PATH
contains /snap/bin $PATH 
or set -gx PATH /snap/bin $PATH

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/mcrowe/.nodenv/versions/12.14.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/mcrowe/.nodenv/versions/12.14.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

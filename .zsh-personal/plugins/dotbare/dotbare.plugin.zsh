DIR="$HOME/.dotbare"
if [[ -d "$DIR" ]]; then
  [[ ":$PATH:" != *":/$DIR:"* ]] && source $DIR/dotbare.plugin.zsh
fi
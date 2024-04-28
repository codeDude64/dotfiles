#!/bin/sh +x

export CONF_DIR=$HOME/.config

export DOTFILES_DIR=$HOME/dotfiles

remove_file_if_exists() {
  local file="$1"
  if [ -e "$file" ]; then
    rm -rf "$file"
    echo "removed $file successfully"
  fi
}

config_files=(
  $DOTFILES_DIR/config/nvim/lua
  $DOTFILES_DIR/config/nvim/init.lua
)

home_files=(
  $DOTFILES_DIR/.zshrc
  $DOTFILES_DIR/.tmux.conf
)

files_to_remove=(
  $CONF_DIR/nvim/lua
  $CONF_DIR/nvim/init.lua
  $HOME/.zshrc
  $HOME/.tmux.conf
)

for file in "${files_to_remove[@]}"; do
  remove_file_if_exists "$file"
done


for file in "${config_files[@]}"; do
  IFS="/" read -ra path_components <<< "$(readlink -f "$file")"
  last_two_levels="${path_components[-2]}/${path_components[-1]}"

  ln -s "$file" $CONF_DIR/"$last_two_levels"

  echo "$CONF_DIR/$last_two_levels added successfully"

done

for file in "${home_files[@]}"; do
  ln -s "$file" $HOME/$(basename "$file")

  echo "$HOME/$(basename "$file") added successfully"
done



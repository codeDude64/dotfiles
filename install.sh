#!/bin/sh +x

export CONF_DIR=$HOME/.config

export DOTFILES_DIR=$HOME/dotfiles

remove_file_if_exists() {
  local file="$1"
  echo "removing $file ..."
  if [ -e "$file" ]; then
    rm -rf "$file"
    echo "  removed $file successfully"
  fi
}

config_files=(
  $DOTFILES_DIR/config/nvim/lua
  $DOTFILES_DIR/config/nvim/init.lua
  $DOTFILES_DIR/config/tut/themes
  $DOTFILES_DIR/config/tut/accounts.toml
  $DOTFILES_DIR/config/tut/config.toml
)

home_files=(
  $DOTFILES_DIR/.zshrc
  $DOTFILES_DIR/.tmux.conf
)

files_to_remove=(
  $CONF_DIR/nvim/lua
  $CONF_DIR/nvim/init.lua
  $CONF_DIR/tut/themes
  $CONF_DIR/tut/accounts.toml
  $CONF_DIR/tut/config.toml
  $HOME/.zshrc
  $HOME/.tmux.conf
)

for file in "${files_to_remove[@]}"; do
  remove_file_if_exists "$file"
done


for file in "${config_files[@]}"; do
  echo "creating the link of $file"
  absolute_path=$(readlink -f "$file")
  echo "  absolute path of $file is $absolute_path"
  IFS="/" read -ra path_components <<< "$absolute_path"
  last_two_levels="${path_components[-2]}/${path_components[-1]}"
  echo "  got the last_two_levels $last_two_levels"

  ln -s "$file" $CONF_DIR/"$last_two_levels"

  echo "  $CONF_DIR/$last_two_levels added successfully"

done

for file in "${home_files[@]}"; do
  echo "creating the link of the file $file"
  ln -s "$file" $HOME/$(basename "$file")

  echo "  $HOME/$(basename "$file") added successfully"
done



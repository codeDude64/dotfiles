#!/bin/sh +x

export CONFIG_DIR=$HOME/.config

export DOTFILES_DIR=$HOME/dotfiles
export CONFIG_DOTFILES_DIR=$DOTFILES_DIR/config

remove_file_if_exists() {
  local file="$1"
  echo "removing $file ..."
  if [ -e "$file" ]; then
    rm -rf "$file"
    echo "  removed $file successfully"
  fi
}

create_dir_if_doesnt_exists() {
  local dir="$1"
  if [ -d "$dir" ]; then
    echo "The directory $dir already exists"
  else 
    mkdir -p "$dir"
    echo "The directory $dir was created successfully"
  fi
}

config_files=(
  # Neovim
  $CONFIG_DOTFILES_DIR/nvim/lua
  $CONFIG_DOTFILES_DIR/nvim/init.lua
  # Kitty
  $CONFIG_DOTFILES_DIR/kitty/kitty.conf
)

home_files=(
  $DOTFILES_DIR/.zshrc
)

files_to_remove=(
  # Neovim
  $CONFIG_DIR/nvim/lua
  $CONFIG_DIR/nvim/init.lua
  # Kitty
  $CONFIG_DIR/kitty/kitty.conf
  # Home
  $HOME/.zshrc
)

dirs_to_create=(
  $CONFIG_DIR/nvim
  $CONFIG_DIR/kitty
)

for file in "${files_to_remove[@]}"; do
  remove_file_if_exists "$file"
done

for dir in "${dirs_to_create[@]}"; do
  create_dir_if_doesnt_exists "$dir"
done


for file in "${config_files[@]}"; do
  echo "creating the link of $file"
  absolute_path=$(readlink -f "$file")
  echo "  absolute path of $file is $absolute_path"
  IFS="/" read -ra path_components <<< "$absolute_path"
  last_two_levels="${path_components[-2]}/${path_components[-1]}"
  echo "  got the last_two_levels $last_two_levels"

  ln -s "$file" $CONFIG_DIR/"$last_two_levels"

  echo "  $CONFIG_DIR/$last_two_levels added successfully"

done

for file in "${home_files[@]}"; do
  echo "creating the link of the file $file"
  ln -s "$file" $HOME/$(basename "$file")

  echo "  $HOME/$(basename "$file") added successfully"
done



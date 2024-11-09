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
  # Tut
  $CONFIG_DOTFILES_DIR/tut/themes
  $CONFIG_DOTFILES_DIR/tut/accounts.toml
  $CONFIG_DOTFILES_DIR/tut/config.toml
  # Iamb
  $CONFIG_DOTFILES_DIR/iamb/config.toml
  # Kitty
  $CONFIG_DOTFILES_DIR/kitty/kitty.conf
  # Newsboat
  $CONFIG_DOTFILES_DIR/newsboat/urls
  $CONFIG_DOTFILES_DIR/newsboat/config
  # Sway
  $CONFIG_DOTFILES_DIR/sway/config
  # Waybar
  $CONFIG_DOTFILES_DIR/waybar/config.jsonc
  $CONFIG_DOTFILES_DIR/waybar/mediaplayer.py
  $CONFIG_DOTFILES_DIR/waybar/style.css
  # Wofi
  $CONFIG_DOTFILES_DIR/wofi/config
  $CONFIG_DOTFILES_DIR/wofi/style.css
  # MPD
  $CONFIG_DOTFILES_DIR/mpd/mpd.conf
  # MPV
  $CONFIG_DOTFILES_DIR/mpv/mpv.conf
  $CONFIG_DOTFILES_DIR/mpv/input.conf
  # Mako
  $CONFIG_DOTFILES_DIR/mako/config
  # Avizo
  $CONFIG_DOTFILES_DIR/avizo/config.ini
  # Swappy
  $CONFIG_DOTFILES_DIR/swappy/config
  # GTK
  $CONFIG_DOTFILES_DIR/gtk-3.0/settings.ini
  # bin
  $CONFIG_DOTFILES_DIR/bin/power_menu
  $CONFIG_DOTFILES_DIR/bin/share_file
  $CONFIG_DOTFILES_DIR/bin/capture_visible

)

home_files=(
  $DOTFILES_DIR/.zshrc
  $DOTFILES_DIR/.tmux.conf
)

files_to_remove=(
  # Neovim
  $CONFIG_DIR/nvim/lua
  $CONFIG_DIR/nvim/init.lua
  # Tut
  $CONFIG_DIR/tut/themes
  $CONFIG_DIR/tut/accounts.toml
  $CONFIG_DIR/tut/config.toml
  # Iamb
  $CONFIG_DIR/iamb/config.toml
  # Kitty
  $CONFIG_DIR/kitty/kitty.conf
  # Newsboat
  $CONFIG_DIR/newsboat/urls
  $CONFIG_DIR/newsboat/config
  # Sway
  $CONFIG_DIR/sway/config
  # Waybar
  $CONFIG_DIR/waybar/config.jsonc
  $CONFIG_DIR/waybar/mediaplayer.py
  $CONFIG_DIR/waybar/style.css
  # Wofi
  $CONFIG_DIR/wofi/config
  $CONFIG_DIR/wofi/style.css
  # MPD
  $CONFIG_DIR/mpd/mpd.conf
  # MPV
  $CONFIG_DIR/mpv/mpv.conf
  $CONFIG_DIR/mpv/input.conf
  # Mako
  $CONFIG_DIR/mako/config
  # Avizo
  $CONFIG_DIR/avizo/config.ini
  # Swappy
  $CONFIG_DIR/swappy/config
  # GTK
  $CONFIG_DIR/gtk-3.0/settings.ini
  # bin
  $CONFIG_DIR/bin/power_menu
  $CONFIG_DIR/bin/share_file
  $CONFIG_DIR/bin/capture_visible
  # Home
  $HOME/.zshrc
  $HOME/.tmux.conf
)

dirs_to_create=(
  $CONFIG_DIR/nvim
  $CONFIG_DIR/tut
  $CONFIG_DIR/iamb
  $CONFIG_DIR/kitty
  $CONFIG_DIR/newsboat
  $CONFIG_DIR/sway
  $CONFIG_DIR/waybar
  $CONFIG_DIR/wofi
  $CONFIG_DIR/mpd
  $CONFIG_DIR/mpv
  $CONFIG_DIR/mako
  $CONFIG_DIR/avizo
  $CONFIG_DIR/swappy
  $CONFIG_DIR/gtk-3.0
  $CONFIG_DIR/bin
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



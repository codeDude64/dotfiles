#!/bin/bash +x

# Remove config if they exits

## Set the configuration arrays
declare -a local_config_dirs=()
declare -a config_dirs=()
declare -a matched_config_dirs=()

index_local_config=0
for config in config/*; do
  IFS="/" read -ra config_tree <<< "$config"
  local_config_dirs[index_local_config]="${config_tree[-1]}"
  ((index_local_config++))
done

unset 'index_local_config'

index_config=0
for config in ~/.config/*; do
  IFS="/" read -ra config_tree <<< "$config"
  config_dirs[index_config]="${config_tree[-1]}"
  ((index_config++))
done

unset 'index_config'


## Find the configs to remove

for local_config in "${local_config_dirs[@]}"; do
  if [[ "${config_dirs[*]}" =~ "$local_config" ]]; then
    rm -rf "$HOME/.config/$local_config"
    echo "The $local_config was removed in the config_dirs"
  fi
done

rm "$HOME/.zshrc"
echo "$HOME/.zshrc removed"

## Create the symbolic link in ~/.config/


for config in config/*; do
  ln -sf "$PWD/$config" "$HOME/.config"
  echo "link from $PWD/$config to $HOME/.config"
done

ln -sf "$PWD/.zshrc" "$HOME"
echo "link from $PWD/.zshrc to $HOME"

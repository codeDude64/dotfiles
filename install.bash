#!/bin/bash +x

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVIM_DIR=$HOME/.config/nvim
export DOTFILES_DIR=$HOME/dotfiles
export NVIM_CACHE_DIR=$HOME/.cache/nvim

rm -rf $NVIM_DIR/init.vim
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf $NVM_DIR/default-packages
rm -rf $NVIM_CACHE_DIR/lua-language-server

mkdir -p $NVIM_DIR
mkdir -p $NVM_DIR


ln -s $DOTFILES_DIR/init.vim $NVIM_DIR/init.vim
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_DIR/default-packages $NVM_DIR/default-packages
ln -s $DOTFILES_DIR/lua-language-server $NVIM_CACHE_DIR/lua-language-server

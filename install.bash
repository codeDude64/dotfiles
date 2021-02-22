#!/bin/bash

$NVM_DIR = ~/.nvim
$NVIM_DIR = ~/.config/nvim

rm -rf $NVIM_DIR/init.vim
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf $NVM_DIR/default-packages

mkdir -p $NVIM_DIR
mkdir -p $NVM_DIR


ln -s ./init.vim $NVIM_DIR/.
ln -s ./.zshrc ~/.
ln -s ./.tmux.conf ~/.
ln -s ./default-packages $NVM_DIR/.

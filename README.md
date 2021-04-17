# Dotfiles

## About

This is my dotfiles to my ArchLinux system,  there are the following configurations.

* nvim
* tmux
* zsh
* nvm default packages

## Install

You can run the script install.bash to install the configuration using: \
`chmod 744 install.bash` \
`./install.bash` 

## Alternative to try it

There is a docker image to test the dotfiles in an archlinux image.
you can run the docker image with the following commands.
\
`docker build -t nvim-imagen .` \
`docker run -it  nvim-imagen /bin/zsh` 


## Acknowledgment

Thanks to 

* [bkegley](https://github.com/bkegley) : The neovim configuration is based on his configuration. Besides, he helped me with my questions.
* [creativenull](https://github.com/creativenull) : The diagnostic configuration is based on his configuration. Besides he helped me when I had issues
* BK discord community: They resolve my noobie questions
* [ernestohs](https://github.com/ernestohs): He shared the alias commands with me.

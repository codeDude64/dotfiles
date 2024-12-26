# Dotfiles

## About

> [!NOTE]
> This project is developing now on [codeberg.org](https://codeberg.org/codeDude/dotfiles) in the name of FLOSS this github repo is working as a mirror. All the changes on codeberg will be reflected on this github repo.


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
`docker run -it  nvim-imagen /bin/zsh` \
When you are in, you should to install node, npm and the default packages (languages servers) using `nvm install stable`

## Install neovim packages
I've used packer.nvim so you need to run the command `:PackerSync` inside neovim to install the packages.

## Acknowledgment

Thanks to 

* [bkegley](https://github.com/bkegley) : The neovim configuration is based on his configuration. Besides, he helped me with my questions.
* [creativenull](https://github.com/creativenull) : The diagnostic configuration is based on his configuration. Besides he helped me when I had issues
* [creativenull](https://github.com/creativenull) : (Yes Again!) For his [efm-server package](https://github.com/creativenull/efmls-configs-nvim) and his support when I have questions.
* BK discord community: They resolve my noobie questions
* [ernestohs](https://github.com/ernestohs): He shared the alias commands with me.

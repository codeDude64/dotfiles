# Dotfiles

## About

> [!NOTE]
> This project is developing now on [codeberg.org](https://codeberg.org/codeDude/dotfiles) in the name of FLOSS. This github repo is working as a mirror, so all the changes on codeberg will be reflected on this github repo.


This is my dotfiles to my ArchLinux system,  there are the following configurations.

* neovim
* sway
* zsh
* kitty
* tut
* iamb
* mpd
* mpv
* newsboat

## Install

You can run the script install.bash to install the configuration using: \
`chmod 744 install.sh` \
`./install.sh` 

## Alternative to try it

> [!NOTE]
> There is time ago that I don't test this.

There is a docker image to test the dotfiles in an archlinux image.
you can run the docker image with the following commands.
\
`docker build -t nvim-imagen .` \
`docker run -it  nvim-imagen /bin/zsh` \
When you are in, you should to install node, npm and the default packages (languages servers) using `nvm install stable`


## Acknowledgment

Thanks to 

* [bkegley](https://github.com/bkegley) : The neovim configuration is based on his configuration. Besides, he helped me with my questions.
* [creativenull](https://github.com/creativenull) : The diagnostic configuration is based on his configuration. Besides he helped me when I had issues
* [creativenull](https://github.com/creativenull) : (Yes Again!) For his [efm-server package](https://github.com/creativenull/efmls-configs-nvim) and his support when I have questions.
* BK discord community: They resolve my noobie questions
* [ernestohs](https://github.com/ernestohs): He shared the alias commands with me.

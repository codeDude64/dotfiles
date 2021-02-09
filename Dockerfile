FROM archlinux

RUN echo yes | pacman -Syu
RUN echo yes | pacman -S git sudo 
RUN echo -e '\n' | pacman -S base-devel
RUN useradd -m build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER build
WORKDIR /home/build
RUN git clone https://aur.archlinux.org/neovim-nightly-git.git
RUN cd neovim-nightly-git && makepkg --noconfirm -rsi --install 
COPY ./inti.vim ~/.config/nvim/init.vim

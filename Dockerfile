FROM archlinux

RUN echo yes | pacman -Syu
RUN echo yes | pacman -S git sudo 
RUN echo -e '\n' | pacman -S base-devel python zsh
RUN useradd -m build -s /bin/zsh
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER build
WORKDIR /home/build
RUN git clone https://aur.archlinux.org/neovim-nightly-git.git
RUN cd neovim-nightly-git && makepkg --noconfirm -rsi --install && cd
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN git clone https://aur.archlinux.org/oh-my-zsh-git.git
RUN cd oh-my-zsh-git && makepkg --noconfirm -rsi --install && cd
COPY . /home/build/dotfiles
RUN sudo chown build dotfiles/install.bash
RUN cd dotfiles && ./install.bash && cd
RUN git clone https://aur.archlinux.org/nvm.git
RUN cd nvm && makepkg --noconfirm -rsi --install && cd
RUN source /usr/share/nvm/init-nvm.sh

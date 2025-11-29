FROM archlinux:latest

ENV USER=root
ENV HOME=/root
ENV NVM_DIR=/root/.nvm

WORKDIR /root/dotfiles

RUN pacman -Syu --noconfirm \
      git base-devel zsh sudo curl wget unzip openssh direnv python pyenv jenv python pyenv jenv \
      vim neovim fzf fd ripgrep xclip

RUN mkdir -p "$NVM_DIR" && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm alias default 'lts/*' && \
    nvm use default

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install --all

RUN git clone https://github.com/JiriChara/dotfiles.git /root/dotfiles

RUN chmod +x install.sh && ./install.sh
# RUN vim -u /root/.vimrc +PlugInstall +qall || true

CMD ["/bin/zsh"]

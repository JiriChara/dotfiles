FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    git base-devel zsh sudo curl wget unzip \
    openssh direnv python pyenv jenv \
    python pyenv jenv vim neovim fzf

ENV USER=root
ENV HOME=/root

WORKDIR /root/dotfiles

RUN git clone https://github.com/JiriChara/dotfiles.git /root/dotfiles

RUN chmod +x install.sh && ./install.sh

CMD ["/bin/zsh"]

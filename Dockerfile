FROM archlinux:latest

RUN pacman -Syu --noconfirm base-devel git zsh sudo

WORKDIR /root

RUN git clone https://github.com/JiriChara/dotfiles.git /root/dotfiles

WORKDIR /root/dotfiles
RUN chmod +x install.sh && ./install.sh

CMD ["/bin/zsh"]

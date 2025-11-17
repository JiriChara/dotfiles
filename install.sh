#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

link_file() {
  local src="$1"
  local dest="$2"
  echo "Linking $dest -> $src"
  ln -sf "$src" "$dest"
}

# Symlink Bash
link_file "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/bash" "$HOME/.bash"

# Symlink Zsh
link_file "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/zsh" "$HOME/.zsh"

# Symlink Git Config
link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

# Symlink Vim & Neovim Configs
mkdir -p "$HOME/.config"
link_file "$DOTFILES_DIR/nvimrc" "$HOME/.config/nvimrc"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/vim" "$HOME/.vim"

# Install vim plugins
vim -Es -u ~/.vimrc +PlugInstall +qall

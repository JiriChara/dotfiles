# Jiří's Dotfiles

```
▓█████▄  ▒█████  ▄▄▄█████▓  █████▒██▓ ██▓    ▓█████   ██████
▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒▓██   ▒▓██▒▓██▒    ▓█   ▀ ▒██    ▒
░██   █▌▒██░  ██▒▒ ▓██░ ▒░▒████ ░▒██▒▒██░    ▒███   ░ ▓██▄
░▓█▄   ▌▒██   ██░░ ▓██▓ ░ ░▓█▒  ░░██░▒██░    ▒▓█  ▄   ▒   ██▒
░▒████▓ ░ ████▓▒░  ▒██▒ ░ ░▒█░   ░██░░██████▒░▒████▒▒██████▒▒
 ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░    ▒ ░   ░▓  ░ ▒░▓  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░
 ░ ▒  ▒   ░ ▒ ▒░     ░     ░      ▒ ░░ ░ ▒  ░ ░ ░  ░░ ░▒  ░ ░
 ░ ░  ░ ░ ░ ░ ▒    ░       ░ ░    ▒ ░  ░ ░      ░   ░  ░  ░
   ░        ░ ░                   ░      ░  ░   ░  ░      ░
 ░
   Linux • Bash/Zsh • Vim/Neovim
```

These are my personal dotfiles. If you want to use them, make sure to **fork the repo** and modify any settings you don’t like or want to change.

These dotfiles are designed to work on most Linux distributions and support both [**Bash**](https://www.gnu.org/software/bash/) and [**Zsh**](https://www.zsh.org/).

I also provide configurations for [**Vim**](https://www.vim.org/) and [**Neovim**](https://neovim.io/), designed to share as many mappings and settings as possible while preferring Neovim Lua for more modern and powerful customization.

[Rugnak](doc/caveman.png)

> Rugnak open vim! Rugnak write code! Rugnak happy!

## Installation

```
DIR="$HOME/bin"

if [ ! -d "$DIR" ]; then
  mkdir -p "$DIR"
fi
git clone git@github.com:JiriChara/dotfiles.git "$DIR"
cd "$DIR"
./install.sh
```

## Test in Docker Container

```
docker buildx build -t dotfiles .
docker run -it --rm dotfiles
```

Copyright © 2025 Jiří Chára. All Rights Reserved.

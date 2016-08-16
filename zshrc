. ~/bin/dotfiles/zsh/config
. ~/bin/dotfiles/zsh/aliases
. ~/bin/dotfiles/zsh/env

export NVM_DIR="/home/jiri/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

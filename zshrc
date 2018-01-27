. ~/bin/dotfiles/zsh/config
. ~/bin/dotfiles/zsh/aliases
. ~/bin/dotfiles/zsh/env

export NVM_DIR="/home/jiri/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

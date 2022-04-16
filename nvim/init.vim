call plug#begin('$HOME/.vim/bundle')
  " Plugin management
  Plug 'junegunn/vim-plug'

  " File Navigation
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

  " Move, Copy, Remove files
  Plug 'tpope/vim-eunuch'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  " Logs
  Plug 'vim-scripts/TailMinusF'

  " Ruby
  Plug 'tpope/vim-endwise'

  " Text transformation
  Plug 'tpope/vim-abolish' " crs, cru, crc
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'JiriChara/dragvisuals.vim'

  " Text navigation
  Plug 'Lokaltog/vim-easymotion'

  " Syntax
  Plug 'tpope/vim-markdown'
  Plug 'vim-ruby/vim-ruby'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'jason0x43/vim-js-indent'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'

  " Lint
  Plug 'dense-analysis/ale'

  " Airline 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Text complete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Save as Sudo
  Plug 'lambdalisue/suda.vim'

  " Colorscheme
  Plug 'jacoborus/tender.vim'

  " JS / TS
  Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
call plug#end()

source $HOME/.config/nvimrc

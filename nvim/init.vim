call plug#begin('$HOME/.vim/bundle')
  " cSpell:disable

  " Plugin management
  Plug 'junegunn/vim-plug'

  Plug 'thinca/vim-localrc'

  " File Navigation
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

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
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'Quramy/vim-js-pretty-template' " template strings
  Plug 'jparise/vim-graphql'

  " Airline 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Text complete
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Save as Sudo
  Plug 'lambdalisue/suda.vim'

  " Colorscheme
  Plug 'jacoborus/tender.vim'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'kyoz/purify', { 'rtp': 'vim' }

  " cSpell:enable
call plug#end()

source $HOME/.config/nvimrc

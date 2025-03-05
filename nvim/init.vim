call plug#begin('$HOME/.vim/bundle')
  " cSpell:disable

  " Plugin management
  Plug 'junegunn/vim-plug'

  " Local rc
  Plug 'thinca/vim-localrc'

  " File/System Navigation
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Move, Copy, Remove files
  Plug 'tpope/vim-eunuch'

  " Git
  Plug 'tpope/vim-fugitive'

  " Logs
  Plug 'vim-scripts/TailMinusF'

  " Auto add closing statements
  Plug 'tpope/vim-endwise'

  " Text transformation
  Plug 'tpope/vim-abolish' " crs, cru, crc
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'JiriChara/dragvisuals.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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
  Plug 'klimeryk/vim-monkey-c'

  " Airline 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Text complete
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Save as Sudo
  Plug 'lambdalisue/suda.vim'

  " Colorscheme
  Plug 'morhetz/gruvbox'

  " cSpell:enable
call plug#end()

source $HOME/.config/nvimrc

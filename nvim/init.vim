call plug#begin('$HOME/.config/nvim/bundle')
  Plug 'junegunn/vim-plug'

  "File Navigation
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-eunuch'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

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

  Plug 'mattn/webapi-vim'
  Plug 'thinca/vim-localrc'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'godlygeek/tabular'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'
  Plug 'wavded/vim-stylus'
  Plug 'slim-template/vim-slim'

  Plug 'lambdalisue/suda.vim'
  "
  " Colorscheme
  Plug 'jacoborus/tender.vim'

  " JS / TS
  Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
call plug#end()

source $HOME/.config/nvimrc

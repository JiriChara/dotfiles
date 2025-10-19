" ============================
" vim-plug Plugin Management
" ============================
call plug#begin('$HOME/.vim/bundle')

" ============================
" Plugin Manager
" ============================
Plug 'junegunn/vim-plug'

" ============================
" Local Vim Settings
" ============================
Plug 'thinca/vim-localrc'

" ============================
" File / System Navigation
" ============================
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ============================
" File operations
" ============================
Plug 'tpope/vim-eunuch'

" ============================
" Git
" ============================
Plug 'tpope/vim-fugitive'

" ============================
" Logs / Monitoring
" ============================
Plug 'vim-scripts/TailMinusF'

" ============================
" Auto add closing statements
" ============================
Plug 'tpope/vim-endwise'

" ============================
" Text Transformations
" ============================
Plug 'tpope/vim-abolish'        " crs, cru, crc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'JiriChara/dragvisuals.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" ============================
" Text Navigation / Motions
" ============================
Plug 'Lokaltog/vim-easymotion'

" ============================
" Syntax / Language Support
" ============================
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/vim-js-pretty-template'  " template strings
Plug 'jparise/vim-graphql'

" ============================
" Airline / Statusline
" ============================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ============================
" IDE / LSP / Text Completion
" ============================
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" ============================
" Save as Sudo
" ============================
Plug 'lambdalisue/suda.vim'

" ============================
" Colorscheme
" ============================
Plug 'morhetz/gruvbox'

call plug#end()

" ============================
" Source Neovim config
" ============================
source $HOME/.config/nvimrc

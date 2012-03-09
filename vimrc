runtime! debian.vim
runtime macros/matchit.vim

set nocompatible

call pathogen#infect()

set encoding=utf-8

set showcmd
set showmode
set showmatch
set number
set ruler
set laststatus=2

set backspace=indent,eol,start
set autoindent
set copyindent

set hidden

set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase

set incsearch
set hlsearch

set nowrap
set scrolloff=3

set title

set nobackup
set noswapfile
set history=500

set tabstop=2
set shiftwidth=2

set mouse=a

set visualbell

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif
set t_Co=256
set term=gnome-256color
colorscheme ch4rass
" set cursorcolumn

set ttyfast

set listchars=tab:▸\ ,eol:¬

" Ragtags
let g:ragtag_global_maps = 1

nmap <leader>l :set list!<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:snips_author = 'Jiri Chara'

au BufRead,BufNewFile *.scss set filetype=scss

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

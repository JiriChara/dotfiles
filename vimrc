runtime! debian.vim

set nocompatible

call pathogen#infect()

set encoding=utf-8

syntax on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

runtime macros/matchit.vim

set showcmd
set showmode
set showmatch

set backspace=indent,eol,start

set hidden

set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase

set number
set ruler

set incsearch
set hlsearch

set nowrap
set scrolloff=3

set title

set backup
set history=500
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set tabstop=2
set shiftwidth=2

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set mouse=a

set visualbell

set t_Co=256
set term=gnome-256color
colorscheme ch4rass
set cursorcolumn

set ttyfast

set listchars=tab:▸\ ,eol:¬

nmap <leader>l :set list!<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:snips_author = 'Jiri Chara'

au BufRead,BufNewFile *.scss set filetype=scss

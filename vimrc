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
set autoindent
set copyindent

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

set nobackup
set noswapfile
set history=500

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

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

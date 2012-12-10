runtime! debian.vim
runtime macros/matchit.vim

set nocompatible

call pathogen#infect()

let g:snips_author = 'Jiri Chara'

set encoding=utf-8

" Tabs and Spaces
if has("autocmd")
  filetype on
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set showcmd
set showmode
set showmatch
set number
set ruler
set backspace=2
set ts=2 sts=2 sw=2 expandtab

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

set mouse=a

set visualbell

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif
set t_Co=256
colorscheme ch4rass
" set cursorcolumn

set ttyfast

set listchars=tab:▸\ ,eol:¬

" Ragtags
let g:ragtag_global_maps = 1

nmap <leader>l :set list!<CR>

au BufRead,BufNewFile *.scss set filetype=scss

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

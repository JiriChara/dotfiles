call pathogen#infect()

set nocompatible

" Enable syntax
if &t_Co > 2 || has("gui_running")
  syntax on
endif

runtime! debian.vim
runtime! macros/matchit.vim

let g:snips_author = 'Jiri Chara'
let g:rails_no_abbreviations = 1
" let g:ctrlp_clear_cache_on_exit = 0
let g:ragtag_global_maps = 1
let g:EasyMotion_leader_key = '<space>'

let mapleader = "-"
let maplocalleader = "\\"

set encoding=utf-8

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set showcmd
set showmode
set showmatch
set number
set ruler

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

set t_Co=256
set background=dark
colorscheme badwolf

set ttyfast

set listchars=tab:▸\ ,eol:¬

" Tabs and Spaces
set backspace=2
set ts=4 sts=4 sw=4 expandtab
if has("autocmd")
  filetype on
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType scss setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif


" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

if has("autocmd")
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" ====================
" FUNCTION DEFINITIONS
" ====================

" Makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" Open all changed files
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction


" ====================
" INSERT MODE MAPPINGS
" ====================

" jk         : Esc
inoremap jk <Esc>


" ====================
" NORMAL MODE MAPPINGS
" ====================

" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Fast movement between splits
" <c-j>       : go to bottom split
" <c-k>       : go to top split
" <c-h>       : go to left split
" <c-l>       : go to right split
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Mappings to access buffers
" \ll         : list buffers
" \b \f \g    : go back/forward/last-used
" \1 \2 \3    : go to buffer 1/2/3 etc..
nnoremap <leader>ll :ls<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>f :bn<CR>
nnoremap <leader>g :e#<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>
nnoremap <leader>6 :6b<CR>
nnoremap <leader>7 :7b<CR>
nnoremap <leader>8 :8b<CR>
nnoremap <leader>9 :9b<CR>
nnoremap <leader>0 :10b<CR>

nnoremap <leader>h :noh<CR>

nnoremap j gj
nnoremap k gk

nnoremap Q @q

" _$        : remove end line spaces
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" _$        : indent code
nnoremap _= :call Preserve("normal gg=G")<CR>

" \l        : show/hide tabs and line endings
nnoremap <leader>l :set list!<CR>

" \cc       : show/hide cursorline and cursorcolumn
nnoremap <leader>cc :set cursorline! cursorcolumn!<CR>


" ====================
" VISUAL MODE MAPPINGS
" ====================

" \*        : recursively vimgrep for selection
vnoremap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

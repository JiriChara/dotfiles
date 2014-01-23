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
let g:ctrlp_clear_cache_on_exit = 0
let g:ragtag_global_maps = 1
let g:EasyMotion_leader_key = 'ě'

set encoding=utf-8

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

set t_Co=256
set background=dark
colorscheme skittles_berry

set ttyfast

set listchars=tab:▸\ ,eol:¬

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

" jjj         : Esc
ino jjj <Esc>


" ====================
" NORMAL MODE MAPPINGS
" ====================

" Disable arrow keys
nmap <Up> <nop>
nmap <Down> <nop>
nmap <Left> <nop>
nmap <Right> <nop>

" Fast movement between splits
" <c-j>       : go to bottom split
" <c-k>       : go to top split
" <c-h>       : go to left split
" <c-l>       : go to right split
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Mappings to access buffers
" \ll         : list buffers
" \b \f \g    : go back/forward/last-used
" \1 \2 \3    : go to buffer 1/2/3 etc..
nmap <leader>ll :ls<CR>
nmap <leader>b :bp<CR>
nmap <leader>f :bn<CR>
nmap <leader>g :e#<CR>
nmap <leader>1 :1b<CR>
nmap <leader>2 :2b<CR>
nmap <leader>3 :3b<CR>
nmap <leader>4 :4b<CR>
nmap <leader>5 :5b<CR>
nmap <leader>6 :6b<CR>
nmap <leader>7 :7b<CR>
nmap <leader>8 :8b<CR>
nmap <leader>9 :9b<CR>
nmap <leader>0 :10b<CR>

nmap <leader>h :noh<CR>

map Q @q

" _$        : remove end line spaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" _$        : indent code
nmap _= :call Preserve("normal gg=G")<CR>

" \*        : recursively vimgrep for word under cursor
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>

" \l        : show/hide tabs and line endings
nmap <leader>l :set list!<CR>

" \cc       : show/hide cursorline and cursorcolumn
nmap <leader>cc :set cursorline! cursorcolumn!<CR>


" ====================
" VISUAL MODE MAPPINGS
" ====================

" \*        : recursively vimgrep for selection
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

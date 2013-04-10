call pathogen#infect()

runtime! debian.vim
runtime macros/matchit.vim

set nocompatible

let g:snips_author = 'Jiri Chara'

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

set cursorline
set cursorcolumn

if &t_Co > 2 || has("gui_running")
  syntax on
endif
set t_Co=256
set background=dark
colorscheme jellybeans

set ttyfast

" Ragtags
let g:ragtag_global_maps = 1

" Tabs and eol
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

" Tabs and Spaces
if has("autocmd")
  filetype on
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif


" No arrow keys
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>

" Movement between splits
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

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

" Makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

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
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Enable syntax
if &t_Co > 2 || has("gui_running")
  syntax on
endif

runtime! debian.vim
runtime! macros/matchit.vim

let g:ragtag_global_maps = 1
let g:EasyMotion_leader_key = '<space>'

let g:acp_enableAtStartup = 0

let mapleader = "-"
let maplocalleader = "\\"

" deoplete configuration
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:tern#filetypes = ['jsx', 'vue', 'js']
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
autocmd CompleteDone * pclose

" Airline
let g:airline_theme= 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" NeoVim Python
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Unite Configuration
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Neomake settings
autocmd! BufWritePost * Neomake
" Disable for Java
let g:neomake_java_javac_maker = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_vue_enabled_makers = ['eslint']

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" set encoding=utf-8

set laststatus=2
set showcmd
set showmode
set showmatch
set number
set ruler

set autoindent
set copyindent
set list

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

set inccommand=split

set background=dark
colorscheme solarized

set ttyfast

set listchars=tab:▸\ ,eol:¬

" Tabs and Spaces
set backspace=2
set ts=2 sts=2 sw=2 expandtab

set t_Co=256

set rtp+=~/.fzf

if has("autocmd")
  filetype on
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType java setlocal ts=2 sts=2 sw=2 expandtab

  autocmd BufNewFile,BufRead *.rss setfiletype xml

  autocmd BufNewFile,BufRead *.min.js set syntax=off
endif

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

"NERD Tree
" open NERDTree everytime VIM is opened and no files selected
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-n> to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

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

" Toggle spell/wrap/linebreak
command! -nargs=* WordSmith call WordSmith()
function! WordSmith()
    set wrap!
    set linebreak!
    set spell!
endfunction

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" AppDirect specific settings
function! ReplaceLTwithHex()
  %s/Į/\\u012E/geI
  %s/į/\\u012F/geI
  %s/Š/\\u0160/geI
  %s/ą/\\u0105/geI
  %s/ū/\\u016B/geI
  %s/Ų/\\u0172/geI
  %s/ų/\\u0173/geI
  %s/ž/\\u017E/geI
  %s/ė/\\u0117/geI
  %s/š/\\u0161/geI
  %s/ę/\\u0119/geI
  %s/ę/\\u0119/geI
  %s/č/\\u010d/geI
endfunction

" AppDirect rush
command! -nargs=* ADRush call ADRush(<f-args>)
function! ADRush(...)
  if a:0 == 0 || a:1 == "ad"
    cd $HOME/Projects/AppDirect/appdirect-parent/appdirect/
  elseif a:1 == "uif"
    cd $HOME/Projects/uif-sass/
  elseif a:1 == "kraken"
    cd $HOME/Projects/frontend-components/
  endif

  e .
endfunction

" AppDirect daily time
command! -nargs=* ADDaily call ADDaily(<f-args>)
function! ADDaily()
  let l:path = "$HOME/Documents/AppDirect/daily-standups/" . strftime("%Y-%m-%d") . ".md"
  execute 'edit' l:path
endfunction

" ====================
" INSERT MODE MAPPINGS
" ====================

" ...

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

" FZF
nnoremap <c-p> :FZF<CR>

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

" Preview markdown
map <leader>mh :!markdown % \|bcat<CR>
map <leader>mm :!ronn -5 --pipe % \|bcat<CR>

nnoremap j gj
nnoremap k gk

nnoremap Q @q

" _$        : remove end line spaces
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" _$        : indent code
nnoremap _= :call Preserve("normal gg=G")<CR>

" \l        : show/hide tabs and line endings
nnoremap <leader>sl :set list!<CR>

" \cc       : show/hide cursorline and cursorcolumn
nnoremap <leader>cc :set cursorline! cursorcolumn!<CR>


" ====================
" VISUAL MODE MAPPINGS
" ====================

" \*        : recursively vimgrep for selection
vnoremap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

" Make dragvisuals.vim work in visual mode
vmap <expr> <c-h> DVB_Drag('left')
vmap <expr> <c-l> DVB_Drag('right')
vmap <expr> <c-j> DVB_Drag('down')
vmap <expr> <c-k> DVB_Drag('up')

" =====================
" COMMAND LINE MAPPINGS
" =====================
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-d> <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g> <C-c>

" Open file in current folder
cabbr <expr> %% expand('%:p:h')

" Enable syntax
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set encoding=utf-8

set laststatus=2
set showcmd
set showmode
set showmatch
set number
set ruler

set autoindent
set copyindent
set list

set cmdheight=2
set updatetime=300
set shortmess+=c

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

set synmaxcol=500

if exists('&inccommand') 
  set inccommand=split
endif

" Colorscheme
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme tender

set ttyfast

set listchars=tab:▸\ ,eol:¬

" Tabs and Spaces
set backspace=2
set ts=2 sts=2 sw=2 expandtab

set cursorline
set cursorcolumn

set rtp+=~/.fzf

" Easy Motion
let g:EasyMotion_leader_key = '<space>'

" Leader
let mapleader = "-"
let maplocalleader = "\\"

" COC configuration
let g:coc_global_extensions = [
  \'coc-tsserver',
  \'coc-eslint',
  \'coc-emmet',
  \'coc-highlight',
  \'coc-prettier',
  \'coc-pairs',
  \'coc-spell-checker',
  \'coc-json',
  \'coc-html',
  \'coc-css'
\]
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Airline
let g:airline_theme='tender'
let g:airline_powerline_fonts = 1
let g:powerline_loaded = 1

" NeoVim Python
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Multi cursor
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-c>'
let g:VM_maps['Find Subword Under'] = '<C-c>'


if has("autocmd")
  filetype on

  setlocal ts=2 sts=2 sw=2 expandtab

  autocmd BufNewFile,BufRead *.min.js set syntax=off

  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

  " No syntax enabled for huge js files
  autocmd Filetype javascript if getfsize(@%) > 300 * 1024 | setlocal syntax=OFF | endif

  " Prevent syntax out of sync issue for large jsx/tsx files
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
endif

"NERD Tree
nmap <C-n> :NERDTreeToggle<CR>

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

" At the moment NeoVim is no able to run interactive commands using :!.
" This issue is being addressed in
" https://github.com/neovim/neovim/issues/5431
if has('nvim')
  cnoreabbrev SudoWrite SudaWrite
  cnoreabbrev SudoOpen SudaOpen
endif

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
noremap <leader>b :Buffers<CR>
nnoremap <leader>ll :ls<CR>
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

" \*        : recursively vimgrep for selection
vnoremap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

" Make dragvisuals.vim work in visual mode
vmap <expr> <c-h> DVB_Drag('left')
vmap <expr> <c-l> DVB_Drag('right')
vmap <expr> <c-j> DVB_Drag('down')
vmap <expr> <c-k> DVB_Drag('up')

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

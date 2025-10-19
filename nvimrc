" ============================
" General Settings
" ============================
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if &compatible
  set nocompatible
endif

set encoding=utf-8
set termguicolors
set laststatus=2
set showcmd
set showmode
set showmatch
set number
set ruler
set cursorline
set cursorcolumn
autocmd FileType nerdtree setlocal nocursorcolumn
autocmd FileType help setlocal nocursorcolumn

set autoindent
set copyindent
set list
set cmdheight=2
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
set nowritebackup
set noswapfile
set history=500
set mouse=a
set visualbell
set synmaxcol=500
set updatetime=300
set nrformats-=octal
set display+=lastline
set ttyfast

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

if exists('&inccommand')
  set inccommand=split
endif

" ============================
" Appearance
" ============================
set background=dark
colorscheme gruvbox

" Airline settings
if !has("nvim")
  let g:airline_powerline_fonts = 1
  let g:powerline_loaded = 1
  let g:airline_symbols_ascii = 0
  let g:airline#extensions#coc#enabled = 1
endif

" ============================
" Tabs & Indentation
" ============================
set backspace=2
set ts=2 sts=2 sw=2 expandtab
set listchars=tab:▸\ ,eol:¬

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

" ============================
" Leader Keys
" ============================
let mapleader = "-"
let maplocalleader = "\\"

" ============================
" COC Configuration
" ============================
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
      \'coc-css',
      \'coc-biome',
      \'@yaegassy/coc-tailwindcss3'
      \]

" Coc key mappings
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ============================
" Plugin Settings
" ============================

" Easy Motion
if !has("nvim")
  let g:EasyMotion_leader_key = '<space>'
endif

" Multi Cursor
if !has("nvim")
  let g:VM_maps = {}
  let g:VM_maps['Find Under'] = '<C-c>'
  let g:VM_maps['Find Subword Under'] = '<C-c>'
endif

" ============================
" Filetype Tweaks
" ============================
if has("autocmd")
  filetype on
  filetype plugin indent on

  autocmd BufNewFile,BufRead *.min.js set syntax=off
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  autocmd Filetype javascript if getfsize(@%) > 300 * 1024 | setlocal syntax=OFF | endif
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" NERDTree / NvimTree
if has("nvim")
  nmap <C-n> :NvimTreeToggle<CR>
else
  nmap <C-n> :NERDTreeToggle<CR>
endif

" ============================
" Search Utilities
" ============================
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" ============================
" Formatting / Cleanups
" ============================
function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap _= :call Preserve("normal gg=G")<CR>

" ============================
" Toggle Spell / Wrap / Linebreak
" ============================
command! -nargs=* WordSmith call WordSmith()
function! WordSmith()
  set wrap!
  set linebreak!
  set spell!
endfunction

" ============================
" Mappings / Keybindings
" ============================

" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Split movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" FZF
nnoremap <c-p> :FZF<CR>

" Buffers and highlighting
noremap <leader>b :Buffers<CR>
nnoremap <leader>h :noh<CR>

" Logical line movement
nnoremap j gj
nnoremap k gk

" Fast macro record
nnoremap Q @q

" Toggle cursorline/cursorcolumn
nnoremap <leader>cc :set cursorline! cursorcolumn!<CR>

" Drag visuals
vmap <expr> <c-h> DVB_Drag('left')
vmap <expr> <c-l> DVB_Drag('right')
vmap <expr> <c-j> DVB_Drag('down')
vmap <expr> <c-k> DVB_Drag('up')

" Linux-like commands in command mode
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

" ============================
" Misc / Fixes
" ============================
if has('nvim')
  cnoreabbrev SudoWrite SudaWrite
  cnoreabbrev SudoOpen SudaOpen
endif

" Sign column
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

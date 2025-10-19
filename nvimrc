" Enable syntax.
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

" Show cursor line and column only in the current window.
set cursorline cursorcolumn
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

" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys).
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Faster scrolling.
" Use :set lazyredraw if performance is bad in huge files.
set ttyfast

if exists('&inccommand')
  set inccommand=split
endif

" Colorscheme
set background=dark
" cSpell:disable
let my_colorscheme = 'gruvbox'
execute 'colorscheme ' . my_colorscheme
" cSpell:enable

" Default Tabs and Spaces
set backspace=2
set ts=2 sts=2 sw=2 expandtab
set listchars=tab:▸\ ,eol:¬

" Easy Motion

" Leader command
let mapleader = "-"
let maplocalleader = "\\"

if !has("nvim")
  let g:EasyMotion_leader_key = '<space>'
endif

" COC plugins
" cSpell:disable
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
" cSpell:enable

" Remap keys for applying codeAction to the current line.
nmap <leader>ca <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" <CR> text completion.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Sign column replaces the line number.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Airline settings.
let g:airline_theme = my_colorscheme
let g:airline_powerline_fonts = 1
let g:powerline_loaded = 1
let g:airline_symbols_ascii = 0
let g:airline#extensions#coc#enabled = 1

" Multi cursor
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-c>'
let g:VM_maps['Find Subword Under'] = '<C-c>'

" Tweaks for large JS/TS files
if has("autocmd")
  filetype on

  autocmd BufNewFile,BufRead *.min.js set syntax=off

  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

  " No syntax enabled for huge js files
  autocmd Filetype javascript if getfsize(@%) > 300 * 1024 | setlocal syntax=OFF | endif

  " Prevent syntax out of sync issue for large jsx/tsx files
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
endif

" NERD Tree settings
if has("nvim")
  nmap <C-n> :NvimTreeToggle<CR>
else
  nmap <C-n> :NERDTreeToggle<CR>
endif

" Restore cursor position
if has("autocmd")
  filetype plugin indent on

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

" _$ Remove trailing spaces.
" _= Align code.
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

" Fast movement between splits.
" <c-j> : go to bottom split
" <c-k> : go to top split
" <c-h> : go to left split
" <c-l> : go to right split
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" FZF
nnoremap <c-p> :FZF<CR>

" Mappings to access buffers.
noremap <leader>b :Buffers<CR>

" Turn of highlight.
nnoremap <leader>h :noh<CR>

" Move down by logical lines by default instead of wrapped lines.
nnoremap j gj
nnoremap k gk

" Fast macro record
nnoremap Q @q

" Show/hide cursorline and cursorcolumn
nnoremap <leader>cc :set cursorline! cursorcolumn!<CR>

" Make dragvisuals.vim work in visual mode
vmap <expr> <c-h> DVB_Drag('left')
vmap <expr> <c-l> DVB_Drag('right')
vmap <expr> <c-j> DVB_Drag('down')
vmap <expr> <c-k> DVB_Drag('up')

" Linux like commands
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

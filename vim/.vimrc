" Plugins
source ~/packages.vim

" check what's the syntax
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:colorizer_auto_filetype='css,html,yaml'
" for vim gutter, set to 4000 otherwise
" set updatetime=4000

" general settings
set wildmenu
set path=$PWD/**
set backspace=indent,eol,start " make vim behave like any other editors
let mapleader=','              " set leader character
set linespace=15               " spacing between lines
se mouse+=a                    " enable mouse support
set noswapfile                 " disable creation of .swap
set hidden                     " hides buffer instead of closing them
set clipboard+=unnamedplus          " make os's clipboard work
set ic                         " set ignore case when searching
set nocompatible               " enable vim features by opting out of vi compatibility
syntax enable                  " enable syntax detection
filetype indent on             " add indent on file type
filetype plugin on             " turn on plugin for file type
set bg=dark                    " use dark background color
set laststatus=2               " always show the status line
set expandtab                  " tab to spaces
set wrap

" line number
set rnu                        " turn on relative numbers
set number                     " set current line number

" default tabs and indentation
set tabstop=2                  " number of visual spaces per tab
set shiftwidth=2               " number of spaces for each step of autoindent
set autoindent                 " auto indent on a new line
set encoding=utf-8             " encode utf-8 by default
set foldmethod=indent     " fold method to maker, default folding of vim sucks
let g:gitgutter_preview_win_floating = 0
"setlocal foldmarker={,}        " for js, and css
set foldlevel=999               " don't start window folded

" search
set incsearch                  " search as characters are entered
set hlsearch                   " highlight matches
set ignorecase                 " ignore case when searching lowercase
set smartcase                  " don't ignore case when inserting uppercase characters

set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'up': '~60%' }

" lightline configuration
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" colorscheme PaperColor
" colorscheme night-owl
" colorscheme corvine
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

if (has("termguicolors"))
 set termguicolors
endif

" non printable characters
set list                                                  " show non-printable characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬ " customize shown characters

" ---- mappings
" make it easy to edit vimrc file use $myvimrc as global variable
nmap <Leader>es :update<cr>
nmap <Leader>ev :tabedit ~/.vimrc<cr>

" switch to alternate file
noremap <Leader>6 <C-^>

noremap <Leader>z :update<cr>
noremap <Leader>q :q<cr>
noremap <Leader>o :only<cr>
noremap <Leader>w <C-w>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap / /\v
vnoremap / /\v

noremap <C-6> <C-^>

" automatically source the vimrc file on save.
"autocmd! BufWritePost $MYVIMRC source %
augroup autosourcing
  autocmd!
  autocmd! bufwritepost ~/.vimrc source $MYVIMRC
augroup end

" map space to nerd tree
noremap <leader>kb :NERDTreeToggle<CR>
let NERDTreeIgnore=['*/node_modules/*']

" easyalign mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" make easyalign ignore spaces
let g:easy_align_ignore_groups = []

" custom function to strip spaces ~ from Drew Neil
" strip white spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nmap <silent> ./ :nohlsearch<CR>

" netrw settings
let g:netrw_keepdir = 0

" ---- emmet
"  make it work on html,css,javascript
"  make Ctrl-z default mapping
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_leader_key='<C-z>'

" ---- bufferline
let g:bufferline_echo = 1

" run in 256 on normal vim
if !has('gui_running')
  set t_Co=256
endif

" fzf mappings
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>h :History<CR>

" Quickly create a new terminal in a vertical split
tnoremap <Leader>% <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>
noremap <Leader>% :vsp<CR><C-w><C-w>:term<CR>
inoremap <Leader>% <Esc>:vsp<CR><C-w><C-w>:term<CR>

" Quickly create a new terminal in a horizontal split
tnoremap <Leader>" <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>
noremap <Leader>" :sp<CR><C-w><C-w>:term<CR>
inoremap <Leader>" <Esc>:sp<CR><C-w><C-w>:term<CR>
" close quicklist and location list
noremap <Leader>c <C-w>c<CR>

" close buffer
nnoremap <silent> <C-q> :CloseBuffersMenu<CR>

" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️ '
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': ['eslint']
\}

"let g:ale_fixers = {
"\ 'javascript': ['prettier'],
"\ 'html': ['prettier']
"\}

"let g:ale_fix_on_save = 1

nnoremap <Leader>ct :ColorToggle<CR>
vmap <leader>t <Plug>(coc-format-selected)
nmap <leader>t <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc settings
let g:coc_global_extensions = [ 'coc-emmet', 'coc-json', 'coc-svelte', 'coc-snippets', 'coc-emoji', 'coc-css', 'coc-prettier' ]

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" for vim-fugitive
" sets diff vertically instead of horizantally
set diffopt+=vertical

" From Jovica / Mastering VIM
" make . to work with visually selected lines
vnoremap . :normal.<CR>”

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv”


" polygot override
"let g:polyglot_disabled = ['jsx']
let g:jsx_ext_required = 1

" *********************

" goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" make cursor blink
set guicursor=a:ver100-iCursor
" nvim specific mappings and settings
if has("nvim")
  set inccommand=nosplit
  " make escape work in the neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " make navigation into and out of neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " i like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " prefer neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif

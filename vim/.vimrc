" Plugins
source ~/packages.vim

" general settings
set backspace=indent,eol,start " make vim behave like any other editors
let mapleader=','              " set leader character
set linespace=15               " spacing between lines
se mouse+=a                    " enable mouse support
set noswapfile                 " disable creation of .swap
set hidden                     " hides buffer instead of closing them
set clipboard=unnamed          " make os's clipboard work
set ic                         " set ignore case when searching
set nocompatible               " enable vim features by opting out of vi compatibility
syntax enable                  " enable syntax detection
filetype indent on             " add indent on file type
filetype plugin on             " turn on plugin for file type
set bg=dark                    " use dark background color
set laststatus=2               " always show the status line

" line number
set rnu                        " turn on relative numbers
set number                     " set current line number

" default tabs and indentation
set tabstop=2                  " number of visual spaces per tab
set shiftwidth=2               " number of spaces for each step of autoindent
set autoindent                 " auto indent on a new line
set encoding=utf-8             " encode utf-8 by default
setlocal foldmethod=marker     " fold method to maker, default folding of vim sucks
setlocal foldmarker={,}        " for js, and css
set foldlevel=99               " don't start window folded

" search
set incsearch                  " search as characters are entered
set hlsearch                   " highlight matches
set ignorecase                 " ignore case when searching lowercase
set smartcase                  " don't ignore case when inserting uppercase characters

set rtp+=/usr/local/opt/fzf

colorscheme PaperColor

" non printable characters
set list                                                  " show non-printable characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ " customize shown characters

" ---- mappings
" Make it easy to edit vimrc file use $MYVIMRC as global variable
nmap <Leader>ev :tabedit ~/.vimrc<cr>

" Automatically source the Vimrc file on save.
autocmd BufWritePost $MYVIMRC source %

" Move visual block up and down easily
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" EasyAlign mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" make EasyAlign ignore spaces
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

" ---- ultisnips
let g:ycm_path_to_python_interpreter    = "/usr/local/bin/python3"
let g:UltiSnipsJumpForwardTrigger       = "<tab>"
let g:UltiSnipsExpandTrigger            = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpBackwardTrigger      = "<s-tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" optional I forgot what this do
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ---- honza/vim-snippets
autocmd FileType javascript UltiSnipsAddFiletypes javascript-node javascript.es6.react

" ---- vim jsx
"  make jsx work with normal .js files
let g:jsx_ext_required = 0

" ---- emmet
"  make it work on html,css,javascript
"  make Ctrl-z default mapping
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" ---- bufferline
let g:bufferline_echo = 1

" run in 256 on normal vim
if !has('gui_running')
  set t_Co=256
endif

" nvim autocompletion"
if has('nvim')
  inoremap <c-x><c-k> <c-x><c-k>
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  imap <expr> <Plug>(expand_or_nl) (has_key(v:completed_item,'snippet')?"\<C-U>":"\<CR>")
  imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(cm_inject_snippet)\<Plug>(expand_or_nl)" : "\<CR>")
endif

" nvim specific mappings and settings
if has("nvim")
  set inccommand=nosplit

  " Make escape work in the Neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " Make navigation into and out of Neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " I like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " Prefer Neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif

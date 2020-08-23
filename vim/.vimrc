" Plugins
source ~/_includes/packages.vim
source ~/_includes/functions.vim

highlight Comment cterm=italic

let g:colorizer_auto_filetype='css,html,yaml'
" for vim gutter, set to 4000 otherwise
" set updatetime=4000

if executable("rg")
  set grepprg=rg\ --vimgrep
  " set grepformat=%f:%l:%c:%m,%f:%l:%m
  " let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
endif

" general settings
set wildmenu
set wildmode=full
set path=$PWD
set path+=$PWD/**
set path+=$PWD/.github/**
set wildignore+=**/node_modules/** " remove node_modules from find
set wildignore+=**/.git/**         " remove node_modules from find
set backspace=indent,eol,start     " make vim behave like any other editors
let mapleader=','                  " set leader character
set linespace=14                   " spacing between lines
se mouse+=a                        " enable mouse support
set noswapfile                     " disable creation of .swap
set hidden                         " hides buffer instead of closing them
set clipboard+=unnamedplus         " make os's clipboard work
set ic                             " set ignore case when searching
set nocompatible                   " enable vim features by opting out of vi compatibility
syntax enable                      " enable syntax detection
filetype indent on                 " add indent on file type
filetype plugin on                 " turn on plugin for file type
set bg=dark                        " use dark background color
set laststatus=1                   " always show the status line
set wrap


" The error format option needs to be set for :cgetbuff to work properly
" https://www.reddit.com/r/vim/comments/7dv9as/how_to_edit_the_vim_quickfix_list/
" set errorformat=%f\|%l\ col\ %c\|%m
set errorformat=%f

" line number
set rnu                                  " turn on relative numbers
set number                               " set current line number

" default tabs and indentation
set tabstop=2                            " number of visual spaces per tab
set shiftwidth=2                         " number of spaces for each step of autoindent
set autoindent                           " auto indent on a new line
set encoding=utf-8                       " encode utf-8 by default
set foldmethod=indent                    " fold method to maker, default folding of vim sucks
let g:gitgutter_preview_win_floating = 0 " setlocal foldmarker={,}				" for js, and css
set foldlevel=999                        " don't start window folded
" set noexpandtab                        " use tabs, not spaces
set expandtab                            " tab to spaces

" search
set incsearch                            " search as characters are entered
set hlsearch                             " highlight matches
set ignorecase                           " ignore case when searching lowercase
set smartcase                            " don't ignore case when inserting uppercase characters

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" non printable characters
set list                                                        " show non-printable characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬ " customize shown characters

" automake directories"
augroup automkdir
  autocmd!
  autocmd BufWritePre *
        \ if !isdirectory(expand('<afile>:h')) |
        \ call mkdir(expand('<afile>:h'), 'p') |
        \ endif
augroup END

augroup autosourcing
  autocmd!
  " dotfiles autosourcing
  autocmd BufWritePost ~/dotfiles/**/* source $MYVIMRC
  autocmd BufWritePost ~/_includes/* source $MYVIMRC
augroup end

nmap <silent> <leader>no :nohlsearch<CR>

" ---- bufferline
let g:bufferline_echo = 1

" run in 256 on normal vim
if !has('gui_running')
  set t_Co=256
endif


let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" for vim-fugitive
" sets diff vertically instead of horizantally
set diffopt+=vertical

" mapping for 3 way merge
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" From Jovica / Mastering VIM
" make . to work with visually selected lines
vnoremap . :normal.<CR>”

" set eslintrc to json
au BufNewFile,BufRead,BufReadPost *.eslintrc set ft=json

" polygot override
"let g:polyglot_disabled = ['jsx']
let g:jsx_ext_required = 1

" *********************

source ~/_includes/colors.vim
source ~/_includes/vimwiki.vim
source ~/_includes/mappings.vim
source ~/_includes/fzf.vim
" source ~/_includes/lsp.vim
source ~/_includes/statusline.vim
source ~/_includes/emmet.vim
source ~/_includes/easyalign.vim
source ~/_includes/dirvish.vim
source ~/_includes/sneak.vim
source ~/_includes/format.vim
source ~/_includes/coc.vim

" nvim specific mappings and settings
if has("nvim")

  " remove guicursor in neovim
  set guicursor=
  set inccommand=nosplit
  " make escape work in the neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " " make navigation into and out of neovim terminal splits nicer.
  " tnoremap <C-h> <C-\><C-N><C-w>h
  " tnoremap <C-j> <C-\><C-N><C-w>j
  " tnoremap <C-k> <C-\><C-N><C-w>k
  " tnoremap <C-l> <C-\><C-N><C-w>l

  " i like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " prefer neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert

endif

vmap <F4> <Esc>:v/\%V/d_ <bar> :noh<cr>
" vmap <F4> <Esc>:sil 1,'<-1d_ <bar> '>+1,$d_<cr><cr>
" map <F4> :<C-U>1,'<-1:delete<CR>:'>+1,$:delete<CR>
"
onoremap i_ :normal! T_vt_<cr>

nmap <silent>gx :sil !wslview <c-r><c-a><cr>


" got this from https://vimways.org/2018/death-by-a-thousand-files/
" native fuzzy finding
set wildcharm=<C-z>
set path-=/usr/include
nnoremap <leader>ge :e **/*<C-z><S-Tab>
nnoremap <leader>gf :find **/*<C-z><S-Tab>
set include=from
set suffixesadd=.js
" syntax on
"


" don't set any guicursor
set guicursor=


" sync clipboard with OS
set clipboard+=unnamedplus

" set path
" set path+=**
" set path+=**/.github
" set path+=**/.config/**
set wildignore+=**/node_modules/**  " remove node_modules from find
set wildignore+=**/.git/**         " remove node_modules from find

if isdirectory("node_modules")
	set path=src/**
else
	set path+=**
endif

let mapleader = "," " map leader

" set rg to default 
if executable("rg")
  set grepprg=rg\ --vimgrep
endif

" automake directories"
augroup automkdir
  autocmd!
  autocmd BufWritePre *
        \ if !isdirectory(expand('<afile>:h')) |
        \ call mkdir(expand('<afile>:h'), 'p') |
        \ endif
augroup END


" general settings
set backspace=indent,eol,start           " make vim behave like any other editors
let mapleader=','                        " set leader character
set linespace=14                         " spacing between lines
se mouse+=a                              " enable mouse support
set noswapfile                           " disable creation of .swap
set hidden                               " hides buffer instead of closing them
set clipboard+=unnamedplus               " make os's clipboard work
set ic                                   " set ignore case when searching
set nocompatible                         " enable vim features by opting out of vi compatibility
syntax enable                            " enable syntax detection
filetype indent on                       " add indent on file type
filetype plugin on                       " turn on plugin for file type
set laststatus=1                         " always show the status line
set undofile                             " set undofile
set undodir=~/_undodir                   " set undodir
set wrap

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

" non printable characters
set list                                                        " show non-printable characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬ " customize shown characters

" The error format option needs to be set for :cgetbuff to work properly
" https://www.reddit.com/r/vim/comments/7dv9as/how_to_edit_the_vim_quickfix_list/
set errorformat=%f\|%l\ col\ %c\|%m
" set errorformat=%f


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

augroup autosourcing
  autocmd!
  " dotfiles autosourcing
  autocmd BufWritePost ~/dotfiles/**/* source $MYVIMRC
augroup end

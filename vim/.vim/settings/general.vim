set guicursor=                              " don't set any guicursor
syntax enable                               " enable syntax detection
filetype indent on                          " add indent on file type
filetype plugin on                          " turn on plugin for file type
set path-=/usr/include                      " remove include since I don't write C
set clipboard=unnamedplus                   " OS clipboard

set wildignore+=**/node_modules/**          " remove node_modules from find
set wildignore+=**/.git/**                  " remove node_modules from find
set wildmode=full                           " set wildmode completion
set wildmenu                                " set wildmenu

" general settings
set backspace=indent,eol,start              " make vim behave like any other editors
let mapleader=','                           " set leader character
set linespace=14                            " spacing between lines
se mouse+=a                                 " enable mouse support
set noswapfile                              " disable creation of .swap
set hidden                                  " hides buffer instead of closing them
set clipboard+=unnamedplus                  " make os's clipboard work
set ic                                      " set ignore case when searching
set nocompatible                            " enable vim features by opting out of vi compatibility
set laststatus=1                            " always show the status line
set undofile                                " set undofile
set undodir=~/_undodir                      " set undodir
set wrap

" line number
set relativenumber                          " turn on relative numbers
set number                                  " set current line number

" default tabs and indentation
set tabstop=2                               " number of visual spaces per tab
set shiftwidth=2                            " number of spaces for each step of autoindent
set autoindent                              " auto indent on a new line
set encoding=utf-8                          " encode utf-8 by default
set foldmethod=indent                       " fold method to maker, default folding of vim sucks
let g:gitgutter_preview_win_floating = 0    " setlocal foldmarker={,}				" for js, and css
set foldlevel=999                           " don't start window folded
set expandtab                               " tab to spaces

" search
set incsearch                               " search as characters are entered
set hlsearch                                " highlight matches
set ignorecase                              " ignore case when searching lowercase
set smartcase                               " don't ignore case when inserting uppercase characters

" non printable characters
set list                                                        " show non-printable characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬ " customize shown characters

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" autosourcing
augroup autosourcing
  autocmd!
  " dotfiles autosourcing
  autocmd BufWritePost ~/dotfiles/**/* source $MYVIMRC
augroup end

" set rg to default 
if executable("rg")
  set grepprg=rg\ --vimgrep
endif

" force fugitive to use vertical diff
" https://github.com/tpope/vim-fugitive/issues/508#issuecomment-406823031
set diffopt+=vertical

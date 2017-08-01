" install vim-plug if it is not installed
" from https://github.com/dboucken/dotfiles/blob/master/.vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/LeaderF'
Plug 'wincent/ferret'

" general enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-bufferline'

" syntax 
Plug 'isRuslan/vim-es6'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'prettier/vim-prettier', { 
	\ 'do': 'yarn install', 
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] } 
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
"Plug 'sheerun/vim-polyglot'

if has('nvim')
	Plug 'roxma/nvim-completion-manager'
	Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
endif

call plug#end()

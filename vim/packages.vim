"'javascript',  install vim-plug if it is not installed
" from https://github.com/dboucken/dotfiles/blob/master/.vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" intellisense for vim!!!
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" fuzzy finder / grep
Plug 'wincent/ferret'
Plug 'junegunn/fzf.vim'

" general enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'Asheq/close-buffers.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-bufferline'
"Plug 'haishanh/night-owl.vim'

Plug '~/experiment/random-program/night-owl.vim'

" syntax 
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'chrisbra/Colorizer'

call plug#end()

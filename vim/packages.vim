"install vim-plug if it is not installed
" from https://github.com/dboucken/dotfiles/blob/master/.vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" intellisense for vim!!!
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" general enhancements
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thaerkh/vim-workspace'
Plug 'stefandtw/quickfix-reflector.vim'

" colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }

" syntax 
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'

call plug#end()

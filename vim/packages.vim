"install vim-plug if it is not installed
" from https://github.com/dboucken/dotfiles/blob/master/.vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" intellisense for vim!!!
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" fuzzy finder / grep
Plug 'wincent/ferret'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" general enhancements
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
" Plug 'Asheq/close-buffers.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-bufferline'
Plug 'haishanh/night-owl.vim'
Plug 'arzg/vim-corvine'
Plug 'dracula/vim', { 'as': 'dracula' }

" syntax 
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'chrisbra/Colorizer'
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

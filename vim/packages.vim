" install vim-plug if it is not installed
" from https://github.com/dboucken/dotfiles/blob/master/.vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif

"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

let g:deoplete#enable_at_startup = 1
Plug 'wincent/ferret'
Plug 'junegunn/fzf.vim'

" general enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
"Plug 'cohama/lexima.vim'
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'SirVer/ultisnips'
"Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-bufferline'
Plug 'haishanh/night-owl.vim'

" syntax 
Plug 'isRuslan/vim-es6'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
"Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
"Plug 'dag/vim-fish'

call plug#end()

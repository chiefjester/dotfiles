" add built in cfilter
" filter quickfix list
packadd cfilter

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

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Plug 'neovim/nvim-lsp'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'steelsojka/completion-buffers'
" Plug 'nvim-lua/lsp-status.nvim'

" Plug 'prabirshrestha/quickpick.vim'
" Plug 'prabirshrestha/quickpick-filetypes.vim'
" Plug 'clozed2u/quickpick-files.vim'

" general enhancements
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'thinca/vim-textobj-between'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'

Plug 'mattn/calendar-vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'romainl/vim-cool'

" colorschemes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox' 
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/gruvbox-material'
" Plug 'arzg/vim-corvine'
Plug 'sbdchd/neoformat'

" syntax 
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'cespare/vim-toml'

call plug#end()


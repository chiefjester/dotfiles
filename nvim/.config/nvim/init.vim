call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'ayu-theme/ayu-vim'
" Plug 'justinmk/vim-dirvish'

call plug#end()

set clipboard=unnamedplus

if (has("termguicolors"))
  set termguicolors
endif

colorscheme ayu
let ayucolor="dark"
set guicursor= 

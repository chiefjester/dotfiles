" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
"
let s:minpac_dir = $HOME . '/.config/nvim/pack/minpac/opt/minpac'
if has('vim_starting')
  if !isdirectory(s:minpac_dir)
    echo "Install minpac ..."
    execute '!git clone --depth 1 https://github.com/k-takata/minpac ' . s:minpac_dir
  endif
endif

if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

if exists('*minpac#init')
  " packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('neovim/nvim-lsp')
  call minpac#add('nvim-lua/lsp-status.nvim')
  call minpac#add('nathunsmitty/diagnostic-nvim')
  call minpac#add('nvim-lua/completion-nvim')

  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt' })
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})

  " additional text objects
  call minpac#add('kana/vim-textobj-entire')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('thinca/vim-textobj-between')

  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('vimwiki/vimwiki')
  call minpac#add('mattn/calendar-vim')

  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('justinmk/vim-sneak')

  " colors
  call minpac#add('gruvbox-community/gruvbox')
  call minpac#add('NLKNguyen/papercolor-theme', { 'type': 'opt' })
  call minpac#add('sainnhe/gruvbox-material', { 'type': 'opt' })

  call minpac#add('honza/vim-snippets')
  call minpac#add('cespare/vim-toml')

  call minpac#add('romainl/vim-cool')
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('mattn/emmet-vim')
endif

" source lua, since it's not autosourced
packadd nvim-lsp
packadd lsp-status.nvim
packadd diagnostic-nvim
packadd completion-nvim

" source settings
runtime settings/general.vim
runtime settings/colors.vim
runtime settings/mappings.vim
runtime settings/functions.vim
runtime settings/statusline.vim
runtime settings/format.vim

" plugin settings
runtime plugins/vim-sneak.vim
runtime plugins/dirvish.vim
runtime plugins/easyalign.vim
runtime plugins/emmet.vim
runtime plugins/vimwiki.vim

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" LSP config, in lua
lua require("lsp")

" Misc settings I like
let g:diagnostic_insert_delay = 1
let g:diagnostic_show_sign = 1
let g:diagnostic_enable_virtual_text = 1
" Complete parentheses for functions
let g:completion_enable_auto_paren = 1
" Work with vim-endwise
let g:completion_confirm_key = "\<C-y>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" let g:completion_enable_snippet = 'UltiSnips'

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

set statusline+=\ %{LspStatus()}

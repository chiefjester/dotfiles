let s:minpac_dir = $HOME . '/.vim/pack/minpac/opt/minpac'

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

  " tpope plugins!
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })

  " additional text objects
  call minpac#add('kana/vim-textobj-entire')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('thinca/vim-textobj-between')

  " for note taking
  call minpac#add('vimwiki/vimwiki')
  call minpac#add('mattn/calendar-vim')

  " file manager and jump
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('justinmk/vim-sneak')

  " colors
  call minpac#add('gruvbox-community/gruvbox')
  call minpac#add('NLKNguyen/papercolor-theme', { 'type': 'opt' })
  call minpac#add('sainnhe/gruvbox-material', { 'type': 'opt' })

  " misc
  call minpac#add('capaj/vscode-standardjs-snippets')
  call minpac#add('cespare/vim-toml')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('mxw/vim-jsx')

  " general enhancements
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('romainl/vim-cool')
  call minpac#add('mattn/emmet-vim')
  " call minpac#add('hrsh7th/vim-vsnip')
  " call minpac#add('hrsh7th/vim-vsnip-integ')

  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('junegunn/fzf', {'type': 'opt'})
  call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
endif

" settings
runtime settings/general.vim
runtime settings/colors.vim
runtime settings/mappings.vim
runtime settings/statusline.vim
runtime settings/format.vim
runtime settings/lint.vim

" plugin settings
runtime plugins/vimwiki.vim
runtime plugins/dirvish.vim
runtime plugins/vim-sneak.vim
runtime plugins/easyalign.vim

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()


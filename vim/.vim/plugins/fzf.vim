let g:fzf_colors = { 'bg': ['bg', 'Pmenu']}

" https://github.com/junegunn/fzf/issues/1393
" remaps escape to c-c
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
noremap <silent><Leader>f :packadd fzf <bar> :packadd fzf.vim <bar> :Files<cr>

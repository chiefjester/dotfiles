" Add homebrew fzf to the vim path:
set rtp+=/usr/local/opt/fzf

" layout up
" let g:fzf_layout = { 'up': '~60%' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:fzf_colors = { 'bg': ['bg', 'Pmenu']}

" https://github.com/junegunn/fzf/issues/1393
" remaps escape to c-c
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

noremap <silent><Leader>f :Files<cr>

" need to set formatexpr to blank on typescript
" https://github.com/neovim/neovim/issues/9249
augroup format
  autocmd!
  autocmd FileType javascript,typescript,javascript.jsx,json,html,scss,css :let &l:formatprg = 'prettier --stdin-filepath ' . expand('%:t')
  autocmd FileType typescript setlocal formatexpr=
augroup end

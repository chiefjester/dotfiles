" https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29
" linting without plugins in vim
augroup Linting
  autocmd!
  autocmd FileType javascript setlocal makeprg=eslint\ --format\ compact | setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,
        \%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m,
        \%-G%.%#
  autocmd BufWritePost *.js silent make! <afile> | silent redraw!

  " This autocommand tells Vim to open the quickfix window whenever a quickfix command is executed (like :make) AND there are valid errors to display.
  autocmd QuickFixCmdPost [^l]* cwindow
augroup END

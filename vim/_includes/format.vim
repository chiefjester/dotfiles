autocmd FileType javascript setlocal formatprg=prettier\ --parser\ babel
autocmd FileType javascript.jsx setlocal formatprg=prettier\ --parser\ babel
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType html setlocal formatprg=js-beautify\ --type\ html
autocmd FileType scss setlocal formatprg=prettier\ --parser\ css
autocmd FileType css setlocal formatprg=prettier\ --parser\ css

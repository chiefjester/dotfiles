function! Osc52Yank()
  let buffer=system('base64 -w0', @0)
  let buffer=substitute(buffer, "\n$", "", "")
  let buffer='\e]52;c;'.buffer.'\x07'
  silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/pts/6")
endfunction
command! Osc52CopyYank call Osc52Yank()
augroup Example
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END

let g:clipboard = {
      \ 'name': 'myClipboard',
      \     'copy': {
      \         '+': 'clipboard-provider copy',
      \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
      \     },
      \     'paste': {
      \         '+': 'clipboard-provider paste',
      \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
      \     },
      \ }

" let g:clipboard = {
"       \ 'name': 'myClipboard',
"       \     'copy': {
"       \         '+': 'clipboard-provider copy',
"       \         '*': 'clipboard-provider copy',
"       \     },
"       \     'paste': {
"       \         '+': 'clipboard-provider paste',
"       \         '*': 'clipboard-provider paste',
"       \     },
"       \ }

" set clipboard=unnamed

" Yank to system clipboard with Y
nmap YY "+yy
nmap Y "+y
vmap Y "+y"

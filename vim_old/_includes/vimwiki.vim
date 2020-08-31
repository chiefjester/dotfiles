" vimwiki

" " vimwiki folding settings
let g:vimwiki_folding='custom'
" nnoremap <leader>gg <Plug>VimwikiToggleListItem
nmap <Leader>tl <Plug>VimwikiToggleListItem
vmap <Leader>tl <Plug>VimwikiToggleListItem
nmap <Leader>rl <Plug>VimwikiRemoveSingleCB
vmap <Leader>rl <Plug>VimwikiRemoveSingleCB
nmap <c-space> <nul>

let work = {}
let work.path = '~/wiki/work/'
let work.syntax = 'markdown'
let work.ext = '.md'
let work.nested_syntaxes = { 'bash': 'bash', 'javascript': 'javascript'}

let g:vimwiki_list = [work]

" vimwiki foldlevel
augroup vimwikiFoldLevel
  autocmd!
  autocmd BufEnter *.md set foldlevel=1
augroup end

let g:vimwiki_global_ext = 0
" let g:vimwiki_ext2syntax = {}

" vimwiki

" " vimwiki folding settings
let g:vimwiki_folding='custom'
" nnoremap <leader>gg <Plug>VimwikiToggleListItem

let work = {}
let work.path = '~/wiki/'
let work.syntax = 'markdown'
let work.ext = '.md'
let work.nested_syntaxes = { 'bash': 'bash', 'javascript': 'javascript'}

let g:vimwiki_list = [work]

" vimwiki foldlevel
augroup vimwikiSpecifics
  autocmd!
  autocmd FileType vimwiki set foldlevel=2
  autocmd FileType vimwiki nmap <Leader>tl <Plug>VimwikiToggleListItem
  autocmd FileType vimwiki vmap <Leader>tl <Plug>VimwikiToggleListItem
  autocmd FileType vimwiki nmap <Leader>rl <Plug>VimwikiRemoveSingleCB
  autocmd FileType vimwiki vmap <Leader>rl <Plug>VimwikiRemoveSingleCB
  autocmd FileType vimwiki nmap <c-space> <nul>
augroup end

let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = ' ○◐●✓'


let g:node_client_debug = 1 

vmap <leader>t <Plug>(coc-format-selected)
nmap <leader>t <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_node_path = '/home/chris/.volta/bin/node'
" coc settings
let g:coc_global_extensions = [ 'coc-emmet', 'coc-json', 'coc-svelte', 'coc-snippets', 'coc-emoji', 'coc-css', 'coc-prettier', 'coc-tsserver' ]

" let g:coc_explorer_global_presets = {
" \   '.vim': {
" \     'root-uri': '~/dotfiles',
" \   },
" \   'tab': {
" \     'position': 'tab',
" \     'quit-on-open': v:true,
" \   },
" \   'floating': {
" \     'position': 'floating',
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingTop': {
" \     'position': 'floating',
" \     'floating-position': 'center-top',
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingLeftside': {
" \     'position': 'floating',
" \     'floating-position': 'left-center',
" \     'floating-width': 50,
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingRightside': {
" \     'position': 'floating',
" \     'floating-position': 'right-center',
" \     'floating-width': 50,
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'simplify': {
" \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
" \   }
" \ }

" " Use preset argument to open it
" nmap <leader>ee :CocCommand explorer<CR>
" nmap <leader>ef :CocCommand explorer --preset floating<CR>

" " List all presets
" nmap <leader>el :CocList explPresets<CR>

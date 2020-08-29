" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" map <c-p> to manually trigger completion
inoremap <silent><expr> <c-p> completion#trigger_completion()

" diagnostic settings
let g:diagnostic_insert_delay = 1          " delay show of diagnostic since it's distracting while typing
let g:diagnostic_enable_virtual_text = 0   " disable virtual text

" completion settings
let g:completion_enable_auto_signature = 0 " disables signature
let g:completion_enable_auto_paren = 1     " Complete parentheses for functions
set completeopt=menuone,noinsert,noselect  " Set completeopt to have a better completion experience
set shortmess+=c                           " Avoid showing message extra message when using completion

" let g:completion_confirm_key = "\<C-y>"
nmap <silent> [g :PrevDiagnosticCycle<cr>
nmap <silent> ]g :NextDiagnosticCycle<cr>

let g:completion_enable_snippet = 'vim-vsnip'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" let g:completion_chain_complete_list = [
"     \{'complete_items': ['lsp', 'snippet']},
"     \{'mode': '<c-p>'},
"     \{'mode': '<c-n>'}
" \]
" " let g:completion_auto_change_source = 1
" let g:completion_enable_snippet = 'UltiSnips'

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

set statusline+=\ %{LspStatus()}

lua << EOF
local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end
require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}

EOF

" :lua require'nvim_lsp'.tsserver.setup{}

nnoremap <silent>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>

" autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" enable virtual text
let g:diagnostic_enable_virtual_text = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

let g:completion_auto_change_source = 1

nmap <silent> [g :PrevDiagnosticCycle<cr>
nmap <silent> ]g :NextDiagnosticCycle<cr>

highlight Comment cterm=italic gui=italic
highlight LspDiagnosticsHint gui=italic
highlight LspDiagnosticsError gui=italic
" highlight LspDiagnosticsError guifg=#BF616A
" highlight LspDiagnosticsHint guifg=#88C0D0 gui=italic
" highlight LspDiagnosticsHint GruvboxRedSign

" sign define LspDiagnosticsErrorSign text=E texthl=LspDiagnosticsHint linehl= numhl=
" let g:deoplete#enable_at_startup = 1

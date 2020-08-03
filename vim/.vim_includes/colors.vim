if (has("termguicolors"))
  set termguicolors
endif

" if exists('+termguicolors')
"   let &t_8f = "\<Esc[]38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

" colorscheme PaperColor
" colorscheme night-owl
" colorscheme corvine
" colorscheme dracula
" colorscheme gruvbox
colorscheme gruvbox-material

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_sign_column_background = 'none'

let g:gruvbox_invert_selection='0'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_contrast_dark = 'hard'

" For dark version.
set background=dark
hi Normal guibg=1d2021 ctermbg=1d2021
" hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE

" hi netrwMarkFile guibg=#ff00ff ctermbg=#ff00ff
hi netrwMarkFile guibg=#ff00ff


" hi Floating guibg=#000044
hi Pmenu guibg=#1a1a1a
hi Term guibg=#1a1a1a
" hi Pmenu guibg=111111 ctermbg=111111
" hi CocFloating guibg=111111 ctermbg=11111
" hi Quote ctermbg=109 guifg=#83a598
" hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#111111 gui=NONE
" hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
hi Floating guibg=#000000 ctermbg=NONE


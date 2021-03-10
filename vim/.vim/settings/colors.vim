if (has("termguicolors"))
  set termguicolors
endif

colorscheme ayu
let ayucolor="dark"

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_sign_column_background = 'none'

let g:gruvbox_invert_selection='0'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_contrast_dark = 'hard'

" For dark version.
set background=dark
" hi Normal guibg=#1d2021
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE

" spelling
hi clear SpellBad
hi SpellBad cterm=underline

" hi netrwMarkFile guibg=#ff00ff ctermbg=#ff00ff
hi netrwMarkFile guibg=#ff00ff

" hi Floating guibg=#000044
hi Pmenu guibg=#1a1a1a
hi Term guibg=#1a1a1a
hi Floating guibg=#000000 ctermbg=NONE

highlight diffRemoved guifg=red
highlight Comment cterm=italic gui=italic
highlight htmlArg gui=italic cterm=italic
highlight Type gui=italic cterm=italic
highlight Conditional gui=italic cterm=italic
highlight jsFunction gui=italic cterm=italic
highlight jsFuncArgs gui=italic cterm=italic
highlight jsTry gui=italic cterm=italic
highlight jsCatch gui=italic cterm=italic
highlight jsUndefined gui=italic cterm=italic guifg=red

let g:gruvbox_italic=1

" for tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

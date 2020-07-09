" colorscheme PaperColor
" colorscheme night-owl
" colorscheme corvine
" colorscheme dracula
colorscheme gruvbox
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_contrast_dark = 'hard'

" hi Normal guibg=1d2021 ctermbg=1d2021
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE

" hi netrwMarkFile guibg=#ff00ff ctermbg=#ff00ff
hi netrwMarkFile guibg=#ff00ff

if (has("termguicolors"))
  set termguicolors
endif

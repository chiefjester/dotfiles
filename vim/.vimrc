" Plugins
source ~/packages.vim

highlight Comment cterm=italic

" check what's the syntax
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:colorizer_auto_filetype='css,html,yaml'
" for vim gutter, set to 4000 otherwise
" set updatetime=4000

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" vim-workspace directory
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
nnoremap gsw :ToggleWorkspace<CR>
let g:workspace_persist_undo_history = 0 
let g:workspace_autosave = 0

" general settings
set wildmenu
set path=$PWD/**
set path+=$PWD/.github/**
set wildignore+=**/node_modules/** " remove node_modules from find
set wildignore+=**/.git/** " remove node_modules from find
set backspace=indent,eol,start     " make vim behave like any other editors
let mapleader=','                  " set leader character
set linespace=15                   " spacing between lines
se mouse+=a                        " enable mouse support
set noswapfile                     " disable creation of .swap
set hidden                         " hides buffer instead of closing them
set clipboard+=unnamedplus         " make os's clipboard work
set ic                             " set ignore case when searching
set nocompatible                   " enable vim features by opting out of vi compatibility
syntax enable                      " enable syntax detection
filetype indent on                 " add indent on file type
filetype plugin on                 " turn on plugin for file type
set bg=dark                        " use dark background color
set laststatus=2                   " always show the status line
set expandtab                      " tab to spaces
set wrap


set laststatus=2                                                                         " always show statusline
set statusline=                                                                          " clear statusline
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffAdd#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#DiffChange#\ %n\                                                       " buffer number
set statusline+=%#Folded#                                                                " colour
set statusline+=%l                                                                       " current line number
set statusline+=/%L                                                                      " total lines
set statusline+=(%p%%)                                                                   " percentage through the file
set statusline+=%4c                                                                      " cursor column
set statusline+=\|%-4{strwidth(getline('.'))}                                            " line length
set statusline+=%{&buftype!='terminal'?expand('%:p:h:t').'\\'.expand('%:t'):expand('%')} " dir\filename.ext
set statusline+=%m                                                                       " modified flag
set statusline+=%r                                                                       " read only flag
set statusline+=%=                                                                       " left/right separator
set statusline+=\ \|\ %{getcwd()}                                                        " current working directory
set statusline+=\ [%{strlen(&ft)?(&ft\ .\ \',\'):''}                                     " filetype
set statusline+=%{strlen(&fenc)?(&fenc\ .\ \',\'):''}                                    " file encoding
set statusline+=%{&ff}]                                                                  " line endings
set statusline+=%<                                                                       " start to truncate here

" line number
set rnu                        " turn on relative numbers
set number                     " set current line number

" default tabs and indentation
set tabstop=2                            " number of visual spaces per tab
set shiftwidth=2                         " number of spaces for each step of autoindent
set autoindent                           " auto indent on a new line
set encoding=utf-8                       " encode utf-8 by default
set foldmethod=indent                    " fold method to maker, default folding of vim sucks
let g:gitgutter_preview_win_floating = 0 " setlocal foldmarker={,}        " for js, and css
set foldlevel=999                        " don't start window folded

" search
set incsearch                  " search as characters are entered
set hlsearch                   " highlight matches
set ignorecase                 " ignore case when searching lowercase
set smartcase                  " don't ignore case when inserting uppercase characters

set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'up': '~60%' }

" lightline configuration
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" colorscheme PaperColor
" colorscheme night-owl
" colorscheme corvine
colorscheme dracula
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
hi Normal guibg=282A36 ctermbg=282A36
" hi Normal guibg=NONE ctermbg=NONE

" hi netrwMarkFile guibg=#ff00ff ctermbg=#ff00ff 
hi netrwMarkFile guibg=#ff00ff 

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

if (has("termguicolors"))
 set termguicolors
endif

" non printable characters
set list                                                  " show non-printable characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬ " customize shown characters

" ---- mappings
" make it easy to edit vimrc file use $myvimrc as global variable
nmap <Leader>es :update<cr>
nmap <Leader>ev :tabedit ~/.vimrc<cr>
" source vimrc
" nnoremap <leader>ve :source $MYVIMRC<cr>

noremap <Leader>z :update<cr>
noremap <Leader>q :q<cr>
noremap <Leader>a :qa<cr>
noremap <Leader>o :only<cr>
noremap <Leader>w <C-w>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap / /\v
vnoremap / /\v

" remap split
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

" automake directories"
augroup automkdir
  autocmd!
  autocmd BufWritePre *
          \ if !isdirectory(expand('<afile>:h')) |
              \ call mkdir(expand('<afile>:h'), 'p') |
          \ endif
augroup END


" automatically source the vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd! bufwritepost .vimrc,packages.vim source $MYVIMRC
augroup end

" map space to nerd tree
noremap <leader>kb :NERDTreeToggle<CR>
noremap <leader>kf :NERDTreeFind<CR>
let NERDTreeIgnore=['*/node_modules/*']
" let g:NERDTreeHijackNetrw=0
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen = 1
set sessionoptions-=blank

" easyalign mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" make easyalign ignore spaces
let g:easy_align_ignore_groups = []

" custom function to strip spaces ~ from Drew Neil
" strip white spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nmap <silent> <leader>no :nohlsearch<CR>

" netrw settings
let g:netrw_keepdir = 1
let g:netrw_fastbrowse=0
let g:netrw_liststyle=0

" ---- emmet
"  make it work on html,css,javascript
"  make Ctrl-z default mapping
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_leader_key='<C-z>'

" ---- bufferline
let g:bufferline_echo = 1

" run in 256 on normal vim
if !has('gui_running')
  set t_Co=256
endif

" general enhancements
" alternative for multi cursors
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"
vnoremap cc c

function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

nnoremap <Leader>l :ls<CR>:b<space>

" Quickly create a new terminal in a vertical split
tnoremap <Leader>% <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>I
noremap <Leader>% :vsp<CR><C-w><C-w>:term<CR>I
inoremap <Leader>% <Esc>:vsp<CR><C-w><C-w>:term<CR>I

" Quickly create a new terminal in a horizontal split
tnoremap <Leader>" <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>I
noremap <Leader>" :sp<CR><C-w><C-w>:term<CR>I
inoremap <Leader>" <Esc>:sp<CR><C-w><C-w>:term<CR>I

" close buffer
nnoremap <silent> \x :cclose<CR>
nnoremap <silent> \c :copen<CR>

nnoremap <Leader>ct :ColorToggle<CR>
vmap <leader>t <Plug>(coc-format-selected)
nmap <leader>t <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc settings
let g:coc_global_extensions = [ 'coc-emmet', 'coc-json', 'coc-svelte', 'coc-snippets', 'coc-emoji', 'coc-css', 'coc-prettier' ]

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" for vim-fugitive
" sets diff vertically instead of horizantally
set diffopt+=vertical

" mapping for 3 way merge
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" From Jovica / Mastering VIM
" make . to work with visually selected lines
vnoremap . :normal.<CR>”

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv”

" set eslintrc to json
au BufNewFile,BufRead,BufReadPost *.eslintrc set ft=json

" polygot override
"let g:polyglot_disabled = ['jsx']
let g:jsx_ext_required = 1

" *********************

" goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" make cursor blink
" set guicursor=a:ver100-iCursor

" multi cursors
nmap <silent> <C-c> <Plug>(coc-cursors-position)
" nmap <silent> <C-d> <Plug>(coc-cursors-word)
" xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`

" nvim specific mappings and settings
if has("nvim")

  " remove guicursor in neovim
  set guicursor=
  set inccommand=nosplit
  " make escape work in the neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " make navigation into and out of neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " i like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " prefer neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert

endif

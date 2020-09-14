let mapleader = "," " map leader

" make it easy to edit dotfiles
nmap <silent><Leader>ev :tabnew <bar>:tcd ~/dotfiles/vim/.vim/<bar>:e ./init.vim<bar>:setlocal path=.,,,**<cr><cr><cr>

" mappings
noremap <silent><Leader>z :update<cr>
noremap <silent><Leader>q :q<cr>
noremap <silent><Leader>Q :q!<cr>
noremap <silent><Leader>a :qa<cr>
noremap <silent><Leader>A :qa!<cr>
noremap <silent><Leader>o :only<cr>
noremap <silent><Leader>w <C-w>

" browse buffer fast!
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <Leader>gg :g//#<Left><Left>

" start wildcart expansion
set wildcharm=<C-z>
nnoremap <leader>ge :e **/<C-z><S-Tab>

" remove usr/include from path, vim has deep roots from c
set path-=/usr/include
nnoremap <leader>gf :find **/<C-z><S-Tab>
nnoremap <Leader>gs :G<cr>

" for js settings
set include=from
set suffixesadd=.js

" set to magic
nnoremap / /\v
vnoremap / /\v

" general enhancements
" alternative for multi cursors
" thanks Kevin, taken from: http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *Ncgn
nnoremap cN *NcgN

vnoremap <expr> cn g:mc . "Ncgn"
vnoremap <expr> cN g:mc . "NcgN"
vnoremap cc c

function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" open url
nmap gx :!xdg-open <c-r><c-a><cr>

" close buffer
nnoremap <silent> \x :cclose<CR>
nnoremap <silent> \c :copen<CR>

" mapping for 3 way merge
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" From Jovica / Mastering VIM
" make . to work with visually selected lines
vnoremap . :normal.<CR>”

" map W to w
cnoreabbrev W update
cnoreabbrev w update

imap <leader>no **<C-R>=strftime('%c')<C-M>**

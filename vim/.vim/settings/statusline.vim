
" status line settings

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
set statusline+=\ \| 
set statusline+=\ <%h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P                    " fugitive
set statusline+=%=                                                                       " left/right separator
set statusline+=\ \|\ %{getcwd()}                                                        " current working directory
set statusline+=\ [%{strlen(&ft)?(&ft\ .\ \',\'):''}                                     " filetype
set statusline+=%{strlen(&fenc)?(&fenc\ .\ \',\'):''}                                    " file encoding
set statusline+=%{&ff}]                                                                  " line endings
set statusline+=%<                                                                       " start to truncate here


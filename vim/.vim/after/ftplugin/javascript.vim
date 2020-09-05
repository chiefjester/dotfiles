setlocal path+=src/**
let &l:define =
            \ '\(^\s*(*async\s\+function\|(*function\)'
            \ .. '\|^\s*\(\*\|static\|async\|get\|set\|\i\+\.\)'
            \ .. '\|^\s*\(\ze\i\+\)\(([^)]*).*{$\|\s*[:=,]\)'
            \ .. '\|^\s*\(export\s\+\|export\s\+default\s\+\)*\(var\|let\|const\|function\|class\)'
            \ .. '\|\<as\>'

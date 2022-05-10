" Filetype detection for FASTL
" Copyright 2018 The MathWorks, Inc.

" Enable FASTL syntax highlighting and folding for *.fastl and *.ast files
au BufRead,BufNewFile *.fastl set filetype=fastl
au BufRead,BufNewFile *.ast set filetype=fastl

" Eanble for faslt test files .fastl.out, .fastl.actual, .fastl.gold
au BufRead,BufNewFile *.fastl.* set filetype=fastl

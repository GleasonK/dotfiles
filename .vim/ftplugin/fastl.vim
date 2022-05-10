" Filetype plugin for FASTL
" Copyright 2018 The MathWorks, Inc.

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

" Enable FASTL syntax-based folding for *.fastl and *.ast files
setlocal foldmethod=syntax
setlocal foldmethod=syntax

" Open all folds initially (otherwise it is completely folded when loaded)
" https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
au BufWinEnter *.fastl silent! :%foldopen!
au BufWinEnter *.ast silent! :%foldopen!
au BufWinEnter *.fastl.* silent! :%foldopen!

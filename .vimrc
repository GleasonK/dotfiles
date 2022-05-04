" It's VIM, not VI
set nocompatible

" Line numbers
set nu

" A tab produces a 4-space indentation
set softtabstop=4
set shiftwidth=4
set expandtab

" Enable filetype detection
filetype on

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" Highlight syntax in programming languages
syntax on

" Set cursor to be block
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END" Cursor setup

" Include LLVM options
source ~/.vim/.vimrc_llvm

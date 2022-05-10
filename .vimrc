"""" Personal settings
set nocompatible    " It's VIM, not VI

set nu              " line numbers
syntax on           " syntax highlighting
filetype on         " Enable filetype detection

set mouse=a         " enable mouse support (might not work well on Mac OS X)
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw screen only when we need to
set showmatch       " highlight matching parentheses / brackets [{()}]
set laststatus=2    " always show statusline (even with only single window)
set ruler           " show line/col number of the cursor on right side of statusline
set visualbell      " blink cursor on error, instead of beeping

" Tab settings - 4-space indentation
set softtabstop=4
set shiftwidth=4
set expandtab

"""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"""" Remap settings
nnoremap <CR> :nohlsearch<CR><CR> " turn off search highlighting with <CR>
inoremap <C-@> <C-n>  " Ctrl + Space autocomplete

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

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

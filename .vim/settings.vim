
" --------------------- CUSTOM COMMANDS -----------------
" Enable backspace in insert mode
set bs=2

" Enable 'ignore case'
set ic

" Enable incremental search
set incsearch

"Enable line numbers
set number
set relativenumber

" Set indentation to 4 spaces without expanding tabs
set shiftwidth=2
set tabstop=2
set expandtab smarttab

" Enable buffer switching without saving
set hidden
set confirm

" Show the pressed commands in the statusline
set showcmd

" Show the tab completion menu automatically
set wildmenu
set wildmode=longest,full

" Enable mouse support
set mouse=a 

" Change cursor in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

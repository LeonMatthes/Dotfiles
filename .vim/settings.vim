
" --------------------- CUSTOM COMMANDS -----------------
" Enable backspace in insert mode
set bs=2

" Enable 'ignore case'
set ignorecase
set smartcase

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

" Make ESC not laggy
set ttimeoutlen=10

" Make folds persistent
" Disabled for now, causes problems with working dir
" augroup AutoSaveFolds
  " autocmd!
  " autocmd BufWinLeave * mkview
  " autocmd BufWinEnter * silent loadview
" augroup END

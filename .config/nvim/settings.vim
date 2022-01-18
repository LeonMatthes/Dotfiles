"Enable line numbers
set number
set relativenumber

" Enable buffer switching without saving
set hidden
set confirm

" Enable mouse support
set mouse=a

" Faster update time (useful for GitGutter)
set updatetime=100

" Show listchars (tabs, etc.)
set list!

au FileType tex,latex,text,markdown,plaintext setlocal spell

" tabbing
set expandtab

" Searching
set ignorecase
set smartcase

" Allows loading of local project settings
set exrc
set secure

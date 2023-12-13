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

" line wrap
set wrap
set linebreak

set termguicolors

" When saving, NeoVim will create a backup file.
" By default, this renames (moves) the file to a name with `~` and then
" creates a new file.
" Some tools that rely on file-system watches (slint-viewer, knut)
" don't deal with this well.
" Therefore, copy the file instead and overwriting the original is preferred.
" This mainly has a performance downside, but for text files on a modern
" machine, this is not noticeable.
set backupcopy=yes

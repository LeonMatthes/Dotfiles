" Set <Space> as leader as it is very easy to press
let mapleader = " "

" <CR><CR> inserts a newline
" <CR><BS> inserts a newline ontop
nnoremap <CR><CR> :normal o<CR>
nnoremap <CR><BS> :normal O<CR>

" supposedly necessary for <CR> remaps to work correctly
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Allow to clear last search history
nnoremap <leader><space> :nohlsearch<CR>

" Allow to repeat last colon command
nnoremap <leader>. :<Up><CR>

" Allow to disable line numbers quickly for copy-paste
nnoremap <leader><BS> :set number!<CR>:set relativenumber!<CR>

" Easy vimrc reload
nnoremap <leader>r :source ~/.vimrc<CR>:echo "vimrc reloaded!"<CR>

" Shortcut for swapping cpp and header files
map <leader>o :call CurtineIncSw()<CR>












" --------------  VISUAL MODE REMAPPS --------------------
vnoremap / y/<C-R>"

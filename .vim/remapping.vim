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

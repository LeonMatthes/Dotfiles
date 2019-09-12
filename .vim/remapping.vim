" <CR><CR> inserts a newline
" <CR><BS> inserts a newline ontop
nnoremap <CR><CR> :normal o<CR>
nnoremap <CR><BS> :normal O<CR>

:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

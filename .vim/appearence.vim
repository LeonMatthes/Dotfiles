" Set color sheme and general ricing
" if (has("termguicolors"))
" 	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" 	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 	set termguicolors
" endif

syntax enable
colorscheme onedark
hi Normal guibg=#232C34 ctermbg=NONE


"Enable line highlighting for the cursor
set cursorline
" highlight cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#404040 ctermbg=244

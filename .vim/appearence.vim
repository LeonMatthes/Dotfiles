" Set color sheme and general ricing
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE


"Enable line highlighting for the cursor
set cursorline
highlight cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#404040 ctermbg=244

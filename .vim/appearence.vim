" Set color sheme and general ricing
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tchaba
hi Normal guibg=NONE ctermbg=NONE


"Enable line highlighting for the cursor
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#404040 ctermbg=244



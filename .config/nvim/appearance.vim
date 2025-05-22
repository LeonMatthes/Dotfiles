syntax enable

" -------------------------- 24-bit color support -----------
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" ------------------------- nvim-cmp -------------------
"  Based on onedark colors
" let s:colors = onedark#GetColors()
" " Selection
" execute "highlight! PmenuSel guibg=" . s:colors.cursor_grey.gui . " guifg=NONE"

" " gray
" execute "highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=" . s:colors.comment_grey.gui
" execute "highlight! CmpItemMenu guibg=NONE guifg=" . s:colors.comment_grey.gui

" " blue
" execute "highlight! CmpItemAbbrMatch guibg=NONE guifg=" . s:colors.blue.gui
" execute "highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=" . s:colors.blue.gui

" " cyan
" execute "highlight! CmpItemKindVariable guibg=NONE guifg=" . s:colors.cyan.gui
" execute "highlight! CmpItemKindInterface guibg=NONE guifg=" . s:colors.cyan.gui
" execute "highlight! CmpItemKindText guibg=NONE guifg=" . s:colors.cyan.gui
" " purple
" execute "highlight! CmpItemKindFunction guibg=NONE guifg=" . s:colors.purple.gui
" execute "highlight! CmpItemKindMethod guibg=NONE guifg=" . s:colors.purple.gui
" " front
" execute "highlight! CmpItemKindKeyword guibg=NONE guifg=" . s:colors.white.gui
" execute "highlight! CmpItemKindProperty guibg=NONE guifg=" . s:colors.white.gui
" execute "highlight! CmpItemKindUnit guibg=NONE guifg=" . s:colors.white.gui

" let g:onedark_terminal_italics = 1
" colorscheme onedark

colorscheme catppuccin-macchiato

set cursorline

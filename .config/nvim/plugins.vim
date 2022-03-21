" Enable vim-plug and list plugins
call plug#begin(stdpath('data') . '/plugged')
" Theming
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" convenience
Plug 'machakann/vim-highlightedyank'

" Language support
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kosayoda/nvim-lightbulb'

" File handling
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " required by fzf.vim
Plug 'junegunn/fzf.vim'

" Buffer control
Plug 'moll/vim-bbye'

" Easier source code editing
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Source Control
Plug 'airblade/vim-gitgutter'
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'mhinz/vim-signify'

" Easier naviagtion
Plug 'justinmk/vim-sneak'

" Tmux integration
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'

" REPL in VIM
Plug 'jpalardy/vim-slime'

call plug#end()

" ------------------- Airline ---------------------
let g:airline_powerline_fonts=1
let g:airline_theme="powerlineish"

set laststatus=2

" --------------------  LSP config --------------------
luafile ~/.config/nvim/lsp.lua
" Show diagnostics when cursor is on them
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd Cursorhold * lua vim.diagnostic.open_float(0, {scope="line"})
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 500)

nnoremap <leader>o :ClangdSwitchSourceHeader<CR>

" -------------------- nvim-compe (Autocomplete) -------
luafile ~/.config/nvim/nvim-compe.lua
" Allow completion with TAB
inoremap <silent><expr> <TAB> pumvisible() ? compe#confirm() : "\<TAB>"

" --------------------- nvim nvim-lightbulb ------------
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" --------------- NERDTree --------------------
nnoremap <leader>t :NERDTreeToggle<CR>

" --------------- FZF -------------------------
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>s: :Commands<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_buffers_jump=1

" --------------- vim-bbye --------------------
" Bdelete not to be confused with bdelete (see vim-bbye docs)
nnoremap <leader>q :Bdelete<CR>

" --------------- NERDcommenter -------------------
let g:NERDSpaceDelims = 1

" --------------- vim-tmux-navigator -------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-a>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-a>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-a>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-a>l :TmuxNavigateRight<cr>

" ----------------- vim-slime -------------------
let g:slime_target = "neovim"

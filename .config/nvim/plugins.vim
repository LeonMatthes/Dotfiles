" Enable vim-plug and list plugins
call plug#begin(stdpath('data') . '/plugged')
" Theming
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" convenience
Plug 'machakann/vim-highlightedyank'
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'j-hui/fidget.nvim'
Plug 'folke/which-key.nvim'

" Language support
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'tie/llvm.vim'
Plug 'slint-ui/vim-slint'

" Snippets (required by nvim-cmp)
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.0.0'}

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'hedyhli/outline.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'kosayoda/nvim-lightbulb'

" LSP server installer
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim' " LSP server manager
" Improved LTeX
Plug 'barreiroleo/ltex_extra.nvim'

" Debugger
Plug 'nvim-neotest/nvim-nio'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Plugins local to this machine
if !empty(glob("~/.config/nvim/plug.local.vim"))
  source ~/.config/nvim/plug.local.vim
endif

" File handling
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

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

" Tmux integration
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

luafile ~/.config/nvim/plugins.lua

" ------------------- Airline ---------------------
let g:airline_powerline_fonts=1
let g:airline_theme="catppuccin"

set laststatus=2

" --------------------  LSP config --------------------
luafile ~/.config/nvim/lsp.lua
" Show diagnostics when cursor is on them
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd Cursorhold * lua vim.diagnostic.open_float(0, {scope="line"})
autocmd BufWritePre *.rs lua vim.lsp.buf.format({async=false})
autocmd BufWritePre *.cpp lua vim.lsp.buf.format({async=false})
autocmd BufWritePre *.h lua vim.lsp.buf.format({async=false})

nnoremap <leader>o :ClangdSwitchSourceHeader<CR>

" ------------------- outline for symbols -----------------
nnoremap <leader>so :Outline<CR>

"  Note: Must be set up BEFORE nvim-cmp
if !empty(glob("~/.config/nvim/plugins.local.vim"))
  source ~/.config/nvim/plugins.local.vim
endif

" -------------------- nvim-cmp (Autocomplete) -------
luafile ~/.config/nvim/nvim-cmp.lua

" --------------------- nvim nvim-lightbulb ------------
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" ---------------- nvim-dap --------------------------
luafile ~/.config/nvim/nvim-dap.lua

" --------------- NERDTree --------------------
lua require('nvim-tree').setup { diagnostics = { enable = true, show_on_dirs=true, show_on_open_dirs=false } }
lua require('nvim-web-devicons').setup { }

nnoremap <leader>t :NvimTreeToggle<CR>

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

" ----------------- nvim-highlight-colors ------------
lua require("nvim-highlight-colors").setup { render = 'background' }

" ----------------------- cmps -----------------------
function Compose()
  if &modifiable && wordcount().bytes==0 && len(getreg("%")) > 0
    0r! cmps --stdout %
  endif
endfunction

autocmd BufEnter * call Compose()

" ---------------------- which-key ----------------------
lua require('which-key').setup{}

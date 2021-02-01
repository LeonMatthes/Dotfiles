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
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'

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

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme="powerlineish"

" Enable statusline
" if has('python')
  " python from powerline.vim import setup as powerline_setup
  " python powerline_setup()
  " python del powerline_setup
" elseif has('python3')
  " python3 from powerline.vim import setup as powerline_setup
  " python3 powerline_setup()
  " python3 del powerline_setup
" endif

set laststatus=2

" --------------- YouCompleteMe ---------------------
" Remappings
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gt :YcmCompleter GoToType<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>T :YcmCompleter GetType<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
" Other settings
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Disable diagnostics, ALE's job now
let g:ycm_show_diagnostics_ui = 0

" --------------- ALE ----------------
let g:ale_linters = {
      \'rust': ['rls', 'cargo', 'rustfmt'],
      \'cpp': ['clangcheck'],
      \'text': ['textlint']
      \}
let g:ale_fixers = {
      \   'rust': [
      \     'rustfmt'
      \   ]
      \ }
let g:ale_set_balloons = 1
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_hover_cursor = 0

" let g:ale_rust_analyzer_config = {
    " \  'cargo': {'loadOutDirsFromCheck': v:true},
    " \  'procMacro': {'enable': v:true},
    " \}

" Stops the LSP -> Will automatically restart
nnoremap <leader>R :ALEStopAllLSPs<CR>

nnoremap <leader>D :ALELint<CR>:lopen<CR>
nnoremap <leader>i :ALENext<CR>
nnoremap <leader>I :ALEPrevious<CR>

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
let g:slime_target = "vimterminal"

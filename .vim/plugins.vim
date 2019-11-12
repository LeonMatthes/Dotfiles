" Enable vim-plug and list plugins
call plug#begin('~/.vim/plugged')
" Theming
Plug 'joshdick/onedark.vim'

" Language support
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'sheerun/vim-polyglot'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'

" File handling
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " required by fzf.vim
Plug 'junegunn/fzf.vim'

" Buffer control
Plug 'moll/vim-bbye'

" Easer source code editing
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Enable statusline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
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
let g:ycm_clangd_binary_path="/home/Users/lnm/software/llvm-project/build/bin/clangd"
let g:ycm_use_clangd=0
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_allways_populate_location_list = 1

" --------------- ALE ----------------
let g:ale_linters = { 'rust': ['rls', 'rustfmt'] }
let g:ale_fixers = {
      \   'rust': [
      \     'rustfmt'
      \   ]
      \ }
let g:ale_set_balloons = 1
let g:ale_fix_on_save = 1

nnoremap <leader>D :ALELint<CR>:lopen<CR>

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

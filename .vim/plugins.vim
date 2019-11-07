" Enable vim-plug and list plugins
call plug#begin('~/.vim/plugged')
" Theming
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'

" Language support
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'sheerun/vim-polyglot'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'

" File handling
Plug 'scrooloose/nerdtree'

" Buffer control
Plug 'moll/vim-bbye'

" Easer source code editing
Plug 'scrooloose/nerdcommenter'
Plug 'Townk/vim-autoclose'

call plug#end()

" ---------------- Enable statusline ------------------
if(has('python'))
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
endif

if(has('python3'))
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
endif

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
nnoremap <leader>D :YcmDiags<CR>
" Other settings
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_clangd_binary_path="/home/Users/lnm/software/llvm-project/build/bin/clangd"
let g:ycm_use_clangd=0
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_allways_populate_location_list = 1


" --------------- NERDTree --------------------
nnoremap <leader>t :NERDTreeToggle<CR>


" --------------- vim-bbye --------------------
" Bdelete not to be confused with bdelete (see vim-bbye docs)
nnoremap <leader>q :Bdelete<CR>

" --------------- NERDcommenter -------------------
let g:NERDSpaceDelims = 1

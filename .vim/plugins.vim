" Enable vim-plug and list plugins
call plug#begin('~/.vim/plugged')

Plug 'jacoborus/tender.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'joshdick/onedark.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ervandew/supertab'

call plug#end()

" Enable statusline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2

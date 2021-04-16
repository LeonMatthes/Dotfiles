" Set <Space> as leader as it is very easy to press
map <Space> <leader>

" <CR><CR> inserts a newline
" <CR><BS> inserts a newline ontop
nnoremap <CR><CR> :normal o<CR>
nnoremap <CR><BS> :normal O<CR>

" supposedly necessary for <CR> remaps to work correctly
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Allow to clear last search history
nnoremap <leader><space> :pclose<CR>:lclose<CR>:nohlsearch<CR>

" Allow to repeat last colon command
nnoremap <leader>. :<Up><CR>

" Allow to disable line numbers quickly for copy-paste
nnoremap <leader><BS> :set number!<CR>:set relativenumber!<CR>

" Easy vimrc reload
nnoremap <leader>r :source $MYVIMRC<CR>:echo "vimrc reloaded!"<CR>

" Shortcut for swapping cpp and header files
map <leader>o :call CurtineIncSw()<CR>

" Remappings for Location list
" nnoremap <leader>i :lbelow<CR>
" nnoremap <leader>I :labove<CR>

" Tab remaps
" Intentionally don't add a <CR> to this command, so I have the chance to
" enter a filename first
nnoremap <C-t>t :tabnew 
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>j :tabfirst<CR>
nnoremap <C-t>k :tablast<CR>
nnoremap <C-t>q :tabclose<CR>

nnoremap <C-t>H :tabmove -1<CR>
nnoremap <C-t>J :tabmove 0<CR>
nnoremap <C-t>K :tabmove<CR>
nnoremap <C-t>L :tabmove +1<CR>

for tabpageindex in range(1,&tabpagemax)
  execute 'nnoremap <C-t>' . tabpageindex . ' ' . tabpageindex . 'gt'
endfor

" Window navigation ^[ is the ALT key
nnoremap h <C-w>h
nnoremap j <C-w>j
nnoremap k <C-w>k
nnoremap l <C-w>l

nnoremap H <C-w>H
nnoremap J <C-w>J
nnoremap K <C-w>K
nnoremap L <C-w>L

" Same for neovim
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L

" Remap insert mode to auto indent on empty line
" smart indent when entering insert mode with i on empty lines
function! IndentWith(keys)
  if len(getline('.')) == 0
    return "\"_cc"
  else
    return a:keys
  endif
endfunction
nnoremap <expr> a IndentWith("a")
nnoremap <expr> A IndentWith("A")

" Allow window scrolling with Ctrl
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" Allow (K)utting the line
nnoremap K i<CR><ESC>

" --------------  VISUAL MODE REMAPPS --------------------
" Allow for direct search of the selected text

" return a representation of the selected text
" suitable for use as a search pattern
function GetVisualSelection()
  let old_reg = @a
  normal! gv"ay
  let raw_search = @a
  let @a = old_reg
  return substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

vnoremap / y/<C-r>=escape(@", '/\')<CR>
vnoremap ? y?<C-r>=escape(@", '?\')<CR>
vnoremap <C-R> :<C-u>%s/<C-r>=GetVisualSelection()<CR>//gc<left><left><left>

" vnoremap / y/<C-R>"
" vnoremap ? y?<C-R>"
" vnoremap <C-R> y:%s/<C-R>"//gc<left><left><left>

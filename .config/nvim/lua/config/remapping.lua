-- Space as leader (must be set before lazy/plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- Clear search highlights, close aux windows
map('n', '<leader><space>', ':pclose<CR>:lclose<CR>:nohlsearch<CR>:lclose<CR>:cclose<CR>')

-- Repeat last colon command
map('n', '<leader>.', ':<Up><CR>')

-- Toggle line numbers (for copy-paste)
map('n', '<leader><BS>', function()
  vim.opt.number = not vim.o.number
  vim.opt.relativenumber = not vim.o.relativenumber
end)

-- Reload vimrc
map('n', '<leader>r', function()
  vim.cmd('source $MYVIMRC')
  print('vimrc reloaded!')
end)

-- Tab management
map('n', '<Tab>t', ':tabnew ')    -- intentionally no <CR>, allows entering filename
map('n', '<Tab>h', ':tabprevious<CR>')
map('n', '<Tab>l', ':tabnext<CR>')
map('n', '<Tab>j', ':tabfirst<CR>')
map('n', '<Tab>k', ':tablast<CR>')
map('n', '<Tab>q', ':tabclose<CR>')

map('n', '<Tab>H', ':tabmove -1<CR>')
map('n', '<Tab>J', ':tabmove 0<CR>')
map('n', '<Tab>K', ':tabmove<CR>')
map('n', '<Tab>L', ':tabmove +1<CR>')

for i = 1, vim.o.tabpagemax do
  map('n', '<Tab>' .. i, i .. 'gt')
end

-- Window navigation (Alt + hjkl)
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

map('n', '<A-H>', '<C-w>H')
map('n', '<A-J>', '<C-w>J')
map('n', '<A-K>', '<C-w>K')
map('n', '<A-L>', '<C-w>L')

-- Smart indent on empty line when entering insert mode
local function indent_with(keys)
  if vim.fn.getline('.') == '' then
    return '"_cc'
  else
    return keys
  end
end
map('n', 'a', function() return indent_with('a') end, { expr = true })
map('n', 'A', function() return indent_with('A') end, { expr = true })

-- Window scrolling with Ctrl
map('n', '<C-j>', '<C-e>')
map('n', '<C-k>', '<C-y>')

-- Split line (K)
map('n', 'K', 'i<CR><ESC>')

-- VISUAL MODE

-- Search for selected text
map('v', '/', 'y/<C-r>=escape(@", \'/\\\')<CR>')
map('v', '?', 'y?<C-r>=escape(@", \'?\\\')<CR>')

local function get_visual_selection()

  local raw = table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")), "\n")

  -- local old_reg = vim.fn.getreg('a')
  -- vim.cmd('normal! gv"ay')
  -- local raw = vim.fn.getreg('a')
  -- vim.fn.setreg('a', old_reg)
  return vim.fn.substitute(vim.fn.escape(raw, '\\/.*$^~[]'), '\n', '\\\\n', 'g')
end

map('v', '<C-R>', function()
  local selection = get_visual_selection()
  local clear_cmd = vim.api.nvim_replace_termcodes('<C-u>', true, false, true)
  vim.api.nvim_feedkeys(':' .. clear_cmd .. '%s/' .. selection .. '//gc', 'n', false)
  -- position cursor before the flags
  local back = vim.api.nvim_replace_termcodes('<left><left><left>', true, false, true)
  vim.api.nvim_feedkeys(back, 'n', false)
end)

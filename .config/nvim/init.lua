-- Leader must be set before lazy/plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.settings")
require("plugins")        -- lazy.nvim bootstrap + all plugin specs
require("config.remapping")
require("config.appearance")

-- Autoformat on save for C/C++/Rust
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rs", "*.cpp", "*.h" },
  callback = function() vim.lsp.buf.format({ async = false }) end,
})

-- LSP: switch between source/header (clangd)
vim.keymap.set('n', '<leader>o', '<cmd>ClangdSwitchSourceHeader<CR>')

-- cmps: fill empty buffer from template
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.modifiable
        and vim.fn.wordcount().bytes == 0
        and #vim.fn.getreg('%') > 0 then
      vim.cmd([[0r! cmps --stdout "%"]])
    end
  end,
})

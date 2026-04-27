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
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  callback = function(args)
    local buf = args.buf
    local name = vim.api.nvim_buf_get_name(buf)

    if name == ""
        or vim.bo[buf].buftype ~= ""
        or not vim.bo[buf].modifiable
        or vim.fn.isdirectory(name) == 1 then
      return
    end

    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    if #lines ~= 1 or lines[1] ~= "" then
      return
    end

    vim.cmd(("silent 0read !cmps --stdout %s"):format(vim.fn.shellescape(name)))
  end,
})

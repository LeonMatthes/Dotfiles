vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hidden = true
vim.opt.confirm = true

vim.opt.mouse = 'a'

-- Faster update time (useful for GitGutter)
vim.opt.updatetime = 100

-- Show listchars (tabs, etc.) — toggled off by default
vim.opt.list = false

vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Allow loading of local project settings
vim.opt.exrc = true
vim.opt.secure = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.termguicolors = true

-- Copy instead of rename-on-save, so file watchers (slint-viewer, knut) don't break
vim.opt.backupcopy = 'yes'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex", "text", "markdown", "plaintext" },
  callback = function() vim.opt_local.spell = true end,
})

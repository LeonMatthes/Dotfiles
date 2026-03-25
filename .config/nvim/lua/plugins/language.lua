return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  { "octol/vim-cpp-enhanced-highlight",    ft = { "cpp", "c" } },
  { "pangloss/vim-javascript",             ft = { "javascript", "javascriptreact", "typescript" } },
  { "tie/llvm.vim",                        ft = { "llvm", "mir" } },
  { "slint-ui/vim-slint",                  ft = { "slint" } },
}

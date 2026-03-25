return {
  { "neovim/nvim-lspconfig", lazy = true },

  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup()
      -- Full LSP setup (keymaps, handlers, server configs)
      dofile(vim.fn.stdpath("config") .. "/lsp.lua")
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
  },

  {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    keys = { { "<leader>so", "<cmd>Outline<CR>", desc = "Toggle symbol outline" } },
    config = function()
      require("outline").setup({ outline_window = { auto_close = true } })
    end,
  },

  {
    "kosayoda/nvim-lightbulb",
    event = "BufReadPre",
    config = function()
      require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
    end,
  },

  {
    "onsails/lspkind.nvim",
    lazy = true,
  },

  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "tex", "latex", "markdown" },
  },
}

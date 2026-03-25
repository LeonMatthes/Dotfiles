return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup({})
    end,
  },

  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      require("nvim-highlight-colors").setup({ render = 'background' })
    end,
  },

  {
    "machakann/vim-highlightedyank",
    event = "VeryLazy",
  },

  { "tpope/vim-sleuth", event = "VeryLazy" },

  {
    "scrooloose/nerdcommenter",
    event = "VeryLazy",
    config = function()
      vim.g.NERDSpaceDelims = 1
    end,
  },

  { "tpope/vim-surround", event = "VeryLazy" },
  { "tpope/vim-repeat",   event = "VeryLazy" },

  {
    "moll/vim-bbye",
    keys = { { "<leader>q", "<cmd>Bdelete<CR>", desc = "Close buffer (bbye)" } },
  },
}

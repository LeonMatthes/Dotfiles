return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
    },
    config = function()
      dofile(vim.fn.stdpath("config") .. "/nvim-cmp.lua")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v1.*",
    lazy = true,
  },
}

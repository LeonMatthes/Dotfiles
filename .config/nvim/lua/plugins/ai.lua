return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      -- copilot-setup.lua is loaded conditionally from lsp.lua based on .lspconfig.lua
      -- Loading it here as well would double-setup; the conditional path in lsp.lua
      -- remains the primary trigger. This spec just ensures the plugin is installed.
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    lazy = true,
    dependencies = { "zbirenbaum/copilot.lua" },
  },

  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
      interactions = {
        inline = {
          model = "sonnet-4.6"
        }
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-treesitter/nvim-treesitter",
    },
  },
}

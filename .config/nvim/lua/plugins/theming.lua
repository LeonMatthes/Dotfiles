return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        integrations = {
          cmp = true,
          fidget = true
        }
      })
      -- Apply colorscheme here (priority=1000) so lualine (priority=900) gets
      -- the correct catppuccin theme on its first load.
      vim.cmd("colorscheme catppuccin-macchiato")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    priority = 900,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = require("catppuccin.utils.lualine")("macchiato"),
        },
        extensions = { 'lazy' },
        sections = {
          lualine_b = {'diff', 'diagnostics', 'lazy' },
          lualine_c = {
            {'filename', path=1}
          },
        },
      })
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },
}

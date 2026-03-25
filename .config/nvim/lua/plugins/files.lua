return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = { { "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = false,
        },
      })
    end,
  },

  {
    "junegunn/fzf",
    build = function() vim.fn["fzf#install"]() end,
    lazy = true,
  },

  {
    "junegunn/fzf.vim",
    cmd = { "Files", "Buffers", "Commands", "GFiles", "Marks", "Rg", "Ag" },
    keys = {
      { "<leader>sf", "<cmd>Files<CR>",    desc = "FZF: files" },
      { "<leader>sb", "<cmd>Buffers<CR>",  desc = "FZF: buffers" },
      { "<leader>s:", "<cmd>Commands<CR>", desc = "FZF: commands" },
      { "<leader>sg", "<cmd>GFiles?<CR>",  desc = "FZF: git files" },
      { "<leader>sm", "<cmd>Marks<CR>",    desc = "FZF: marks" },
    },
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_buffers_jump = 1
      vim.g.fzf_colors = {
        fg      = { 'fg', 'Normal' },
        bg      = { 'bg', 'Normal' },
        hl      = { 'fg', 'Comment' },
        ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
        ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
        ['hl+'] = { 'fg', 'Statement' },
        info    = { 'fg', 'PreProc' },
        border  = { 'fg', 'Ignore' },
        prompt  = { 'fg', 'Conditional' },
        pointer = { 'fg', 'Exception' },
        marker  = { 'fg', 'Keyword' },
        spinner = { 'fg', 'Label' },
        header  = { 'fg', 'Comment' },
      }
    end,
  },
}

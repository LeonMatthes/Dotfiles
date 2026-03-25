return {
  { "nvim-neotest/nvim-nio", lazy = true },

  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dd", desc = "DAP: Continue" },
      { "<leader>dc", desc = "DAP: Continue" },
      { "<leader>ds", desc = "DAP: Step over" },
      { "<leader>di", desc = "DAP: Step into" },
      { "<leader>do", desc = "DAP: Step out" },
      { "<leader>dq", desc = "DAP: Terminate" },
      { "<leader>bt", desc = "DAP: Toggle breakpoint" },
      { "<leader>bb", desc = "DAP: Toggle breakpoint" },
    },
    config = function()
      dofile(vim.fn.stdpath("config") .. "/nvim-dap.lua")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
}

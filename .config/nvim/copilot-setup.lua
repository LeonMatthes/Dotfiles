require("copilot").setup({
    copilot_node_command='node-24',
    suggestion = { enabled = false },
    panel = { enabled = false },
  })

require("copilot_cmp").setup()

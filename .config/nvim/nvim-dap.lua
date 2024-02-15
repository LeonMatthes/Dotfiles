local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch LLDB',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Key Mappings
function nmap(key, cmd)
  vim.keymap.set('n', key, cmd)
end

nmap('<leader>dd', function() dap.continue() end)
nmap('<leader>dc', function() dap.continue() end)
nmap('<leader>ds', function() dap.step_over() end)
nmap('<leader>di', function() dap.step_into() end)
nmap('<leader>do', function() dap.step_out() end)
nmap('<leader>dq', function() dap.terminate() end)
nmap('<leader>dh', function() dap.run_to_cursor() end)
nmap('<leader>bt', function() dap.toggle_breakpoint() end)
nmap('<leader>bb', function() dap.toggle_breakpoint() end)
nmap('<leader>bc', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
nmap('<leader>bh', function() dap.set_breakpoint(nil, vim.fn.input('Breakpoint hit count: ')) end)
nmap('<leader>bl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
nmap('<leader>bdd', function() dap.clear_breakpoints() end)

-- Icons
function dapsign(name, icon)
  vim.fn.sign_define(name, { text = icon, texthl = '', linehl = '', numhl = '' })
end

dapsign('DapBreakpoint', '🔴')
dapsign('DapBreakpointRejected', '🚫')
dapsign('DapBreakpointCondition', '🔍')
dapsign('DapLogPoint', '📝')

local dapui = require('dapui')
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Launch.json
require 'dap.ext.vscode'.load_launchjs(nil, { lldb = {'c', 'cpp', 'rust'}})

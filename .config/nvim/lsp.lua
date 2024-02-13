require("mason").setup()
require("mason-lspconfig").setup()


local lsp = require'lspconfig'

-- Use init_buffer function to only map the keys after the language
-- server attaches to the current buffer
local init_buffer = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>H', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format{async=true}<CR>', opts)
  buf_set_keymap('n', '<Tab>', '<cmd>lua require("luasnip").jump()<CR>', opts)
end

--- Set symbols of LSP diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true
  })

-- nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    lsp[server_name].setup {
      on_attach = init_buffer,
      capabilities = capabilities,
    }
  end,
  -- Dedicated handlers for specific LSPs
  ["ltex"] = function()
    -- LTeX - Grammar and spell checking
    lsp.ltex.setup {
      on_attach = function(client, bufnr)
        -- ltex_extra allows ltex to do things like "add to dictionary" and
        -- other code actions
        require("ltex_extra").setup()
        vim.api.nvim_buf_set_option(bufnr, "spell", false)
        init_buffer(client, bufnr)
      end
    }
  end
}


lsp.vimls.setup {
  on_attach = init_buffer,
  capabilities = capabilities,
}
lsp.rust_analyzer.setup {
  on_attach = init_buffer,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = { experimental = { enable = true } },
      check = {
        command = "clippy"
      }
    }
  }
}

lsp.slint_lsp.setup {
    on_attach = init_buffer,
    cmd = { "slint-lsp", "--backend", "GL" },
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
}

local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = "utf-8"

lsp.clangd.setup {
    on_attach = init_buffer,
    cmd = { "clangd", "--header-insertion=never" },
    capabilities = clangd_capabilities,
    flags = {
      debounce_text_changes = 150
    }
}
require("symbols-outline").setup({auto_close=true})

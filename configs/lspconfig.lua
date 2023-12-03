local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local auto_group = vim.api.nvim_create_augroup("LspFormatting", {})
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd" }

capabilities.offsetEncoding = "utf-16"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    disableSuggestions = true,
  },
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    typescript = {
      tsdk = "/Users/yjack/.nvm/versions/node/v18.16.0/lib/node_modules/typescript/lib",
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- settings = {
  --   python = {
  --     analysis = {
  --       typeCheckingMode = "off",
  --     },
  --   },
  -- },
}

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/codeAction" then
      vim.api.nvim_clear_autocmds {
        group = auto_group,
        buffer = bufnr,
      }
      vim.api.nvim_create_augroup("BufWritePre", {
        group = auto_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

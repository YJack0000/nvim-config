local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local auto_group = vim.api.nvim_create_augroup("LspFormatting", {})
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss", "eslint", "volar", "pyright" }

capabilities.offsetEncoding = "utf-16"

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

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

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    -- capabilities = capabilities,
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                target = "aarch64-unknown-none-softfloat",
            },
        },
    },
}

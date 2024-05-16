local null_ls = require "null-ls"
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local opts = {
    debug = true,
    sources = {
        -- webdev stuff
        -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
        b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "json" } }, -- so prettier works only on these filetypes

        -- Lua
        b.formatting.stylua.with {
            extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },

        -- cpp
        b.formatting.clang_format,

        -- vue, react, ts/js
        require("none-ls.formatting.eslint_d").with { filetypes = { "vue", "typescript", "javascript", "typescriptreact" } },
        require("none-ls.diagnostics.eslint_d").with { filetypes = { "vue", "typescript", "javascript", "typescriptreact" } },
        --     debug = true,
        -- b.formatting.prettierd.with { filetypes = { "typescriptreact" } },

        -- python
        -- b.diagnostics.mypy,
        require("none-ls.diagnostics.ruff"),
        b.formatting.black,

        -- golang
        b.formatting.gofmt,
        b.formatting.goimports_reviser,
        -- go install github.com/incu6us/goimports-reviser/v3@latest
    },
    -- on_attach = function(client, bufnr)
    --         if client.supports_method "textDocument/formatting" then
    --             vim.api.nvim_clear_autocmds {
    --                 group = augroup,
    --                 buffer = bufnr,
    --             }
    --             vim.api.nvim_create_autocmd("BufWritePre", {
    --                 group = augroup,
    --                 buffer = bufnr,
    --                 callback = function()
    --                     vim.lsp.buf.format { bufnr = bufnr }
    --                 end,
    --             })
    --         end
    --     end,
}

null_ls.setup(opts)

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {
    -- webdev stuff
    -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua.with {
        extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
    },

    -- cpp
    b.formatting.clang_format.with {
        extra_args = { "--indent-width=4", "--style=Google" },
    },

    -- vue, react, ts/js
    b.formatting.eslint.with { filetypes = { "vue", "typescript", "javascript" } },
    -- b.diagnostics.eslint.with { filetypes = { "vue", "typescript", "javascript" } },

    -- python
    -- b.diagnostics.mypy,
    b.diagnostics.ruff,
    b.formatting.black,

    -- golang
    b.formatting.gofmt,
    b.formatting.goimports_reviser,
    -- go install github.com/incu6us/goimports-reviser/v3@latest
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds {
                group = augroup,
                buffer = bufnr,
            }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}

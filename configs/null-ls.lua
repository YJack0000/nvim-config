local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
    -- webdev stuff
    b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua.with {
        extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
    },

    -- cpp
    b.formatting.clang_format.with {
        extra_args = { "--indent-width=4", "--style=Google" },
    },

    -- vue
    b.formatting.prettier.with { filetypes = { "vue" } },

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
}

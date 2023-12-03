local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- vue
  b.formatting.prettier.with { filetypes = { "vue" } },

  -- python
  b.diagnostics.mypy,
  b.diagnostics.ruff,

  -- golang
  b.formatting.gofmt,
  b.formatting.goimports_reviser,
  -- go install github.com/incu6us/goimports-reviser/v3@latest
}

null_ls.setup {
  debug = true,
  sources = sources,
}

local null_ls = require("null-ls")
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins
local python_path = vim.fn.trim(vim.fn.system("where python"))

local opts = {
	debug = true,
	sources = {
		-- Lua
		b.formatting.stylua.with({
			extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
		}),

		-- cpp
		b.formatting.clang_format,
		-- cmake
		b.diagnostics.cmake_lint,
		b.formatting.cmake_format,

		-- webdev stuff
		b.formatting.prettierd.with({ filetypes = { "html", "markdown", "css", "json" } }), -- so prettier works only on these filetypes
		-- vue, react, ts/js
		require("none-ls.formatting.eslint_d").with({
			filetypes = { "vue", "typescript", "javascript", "typescriptreact" },
		}),
		require("none-ls.diagnostics.eslint_d").with({
			filetypes = { "vue", "typescript", "javascript", "typescriptreact" },
		}),
		--     debug = true,
		-- b.formatting.prettierd.with { filetypes = { "typescriptreact" } },

		-- python
		-- b.diagnostics.mypy.with({
		-- 	extra_args = { "--python-executable", python_path },
		-- }),
        -- b.diagnostics.pylint,
		require("none-ls.diagnostics.ruff"),
		require("none-ls.formatting.ruff").with({
			extra_args = { "--select", "F,E,W,I,S,B,C,N", "--ignore", "E501" },
		}),

		-- golang
		b.formatting.gofmt,
		b.formatting.goimports_reviser,
		-- go install github.com/incu6us/goimports-reviser/v3@latest

		-- docker
		null_ls.builtins.diagnostics.hadolint,
	},
}

null_ls.setup(opts)

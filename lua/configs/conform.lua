local M = {}

M.opts = {
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		lua = { "stylua" },

		-- web
		html = { "prettierd" },
		css = { "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		markdown = { "prettierd" },
		yaml = { "prettierd" },

		-- ts/js — eslint_d first (fixes + formats), fall through to prettierd
		javascript = { "eslint_d", "prettierd", stop_after_first = true },
		javascriptreact = { "eslint_d", "prettierd", stop_after_first = true },
		typescript = { "eslint_d", "prettierd", stop_after_first = true },
		typescriptreact = { "eslint_d", "prettierd", stop_after_first = true },

		-- python
		python = { "ruff_format", "ruff_organize_imports" },

		-- go
		go = { "goimports_reviser", "gofmt" },

		-- c/c++
		c = { "clang_format" },
		cpp = { "clang_format" },

		-- cmake
		cmake = { "cmake_format" },
	},

	formatters = {
		stylua = {
			prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
		},
	},
}

return M

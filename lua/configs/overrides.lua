local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",

		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",

		"json",

		"c",
		"cpp",

		"asm",

		"markdown",
		"markdown_inline",
		"python",
		"vue",

		"go",
		"gosum",
		"gowork",
		"gomod",

		"graphql",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettierd",
		"tailwindcss-language-server",
		"eslint",

		-- vue stuff
		"vue-language-server",

		-- docker stuff
		"docker-compose-language-service",
		"dockerfile-language-server",
        "hadolint",

		-- python stuff
		"pyright",
		"mypy",
		"ruff",

		-- golang stuff
		"gopls",

		-- c/cpp stuff
		"clangd",
		"clang-format",
		"cmakelint",
		-- "cmale_format",
		-- assembly stuff
		"asmfmt",

		-- rust stuff
		"rust-analyzer",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
		ignore = false,
	},

    filters = {
        dotfiles = false,
    },

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},

	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
}

M.telescope = {
	extensions_list = { "themes", "terms", "aerial" },
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = {
				["_"] = false, -- This key will be the default
				json = true, -- You can set the option for specific filetypes
				yaml = true,
			},
		},
	},
}

return M

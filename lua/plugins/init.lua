local overrides = require("configs.overrides")

return {
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	-- event = 'BufWritePre', -- uncomment for format on save
	-- 	config = function()
	-- 		require("configs.conform")
	-- 	end,
	-- },
	--
	{
		"numToStr/Comment.nvim",
		config = function()
			local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
			require("Comment").setup({
				pre_hook = prehook,
			})
		end,
		event = "BufReadPre",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"rmagatti/auto-session",
		event = "VimEnter",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
				pre_save_cmds = { "NvimTreeClose" },
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {
			ensure_installed = {
				"codelldb",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},
			notify = {
				enabled = true,
				view = "mini",
			},
			messages = {
				view = "mini", -- 使用 mini 视图在底部显示消息
				view_error = "mini", -- 错误信息使用 mini 视图
				view_warn = "mini", -- 警告信息使用 mini 视图
				view_info = "mini", -- 信息使用 mini 视图
				view_debug = "mini", -- 调试信息使用 mini 视图
				view_trace = "mini", -- 跟踪信息使用 mini 视图
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"stevearc/aerial.nvim",
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("configs.aerial")
		end,
		lazy = false,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = function()
			require("configs.lazygit").setup()
		end,
	},
	{
		"mgierada/lazydocker.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("lazydocker").setup({})
		end,
		event = "BufRead", -- or any other event you might want to use.
	},
	{
		"olexsmir/gopher.nvim",
		ft = { "go", "gomod", "gotmpl" },
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				event = "InsertEnter",
				config = function()
					require("configs.copilot")
				end,
			},
			{
				"Exafunction/codeium.nvim",
				lazy = false,
				config = function()
					require("codeium").setup({
						-- enable_chat = true,
					})
				end,
			},
		},
		opts = {
			sources = {
				{ name = "copilot", group_index = 1 },
				{ name = "codeium", group_index = 1 },
				{ name = "nvim_lsp", group_index = 1 },
				{ name = "luasnip", group_index = 2 },
				{ name = "buffer", group_index = 2 },
				{ name = "nvim_lua", group_index = 2 },
				{ name = "path", group_index = 2 },
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("configs.null-ls")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = function()
			require("claude-code").setup({
				window = {
					position = "float",
					float = {
						width = "90%",
						height = "90%",
						row = "center",
						col = "center",
						relative = "editor",
						border = "rounded",
					},
				},
				keymaps = {
					toggle = {
						normal = "<C-o>",
						terminal = "<C-o>",
					},
				},
			})
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

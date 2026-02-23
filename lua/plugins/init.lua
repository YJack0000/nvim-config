local overrides = require("configs.overrides")

return {
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
				hover = { enabled = false },
				signature = { enabled = false },
			},
			notify = {
				enabled = true,
				view = "mini",
			},
			messages = {
				view = "mini",
				view_error = "mini",
				view_warn = "mini",
				view_info = "mini",
				view_debug = "mini",
				view_trace = "mini",
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
	},
	{
		"kdheepak/lazygit.nvim",
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
		event = "BufRead",
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
		opts = {},
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
				opts = {
					suggestion = { enable = false },
					panel = { enable = false },
					filetypes = {
						jsx = true,
						lua = true,
						yaml = true,
						markdown = true,
						help = false,
						gitcommit = false,
						gitrebase = false,
						hgcommit = false,
						svn = false,
						cvs = false,
						["."] = false,
					},
				},
			},
		},
		opts = {
			sources = {
				{ name = "copilot", group_index = 1 },
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
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
			-- Quick toggle with Ctrl+comma (alternative to leader keys)
			{ "<C-,>", "<cmd>ClaudeCodeFocus<cr>", desc = "Quick Claude toggle", mode = { "n", "x" } },
		},
		opts = {
			terminal = {
				provider = "auto",
				snacks_win_opts = {
					position = "float",
					width = 0.85,
					height = 0.85,
					border = "rounded",
					backdrop = 80,
					keys = {
						claude_hide = { "<C-,>", function(self) self:hide() end, mode = "t", desc = "Hide" },
						claude_hide_esc = { "<Esc>", function(self) self:hide() end, mode = "t", desc = "Hide" },
					},
				},
			},
			diff_opts = {
				auto_close_on_accept = true,
				vertical_split = true,
			},
		},
	},
}

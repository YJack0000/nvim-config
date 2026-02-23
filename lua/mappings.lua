require("nvchad.mappings")

local map = vim.keymap.set

-- Normal mode
map("n", ";", ":", { desc = "Enter command mode", nowait = true })

-- Lazy
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazy Git" })
map("n", "<leader>ld", "<cmd>Lazydocker<CR>", { desc = "Lazy Docker" })

--Aerial
map("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Aerial Toggle" })
map("n", "{", "<cmd>AerialPrev<CR>", { desc = "Aerial Prev" })
map("n", "}", "<cmd>AerialNext<CR>", { desc = "Aerial Next" })
map("n", "<leader>fo", "<cmd>Telescope aerial<CR>", { desc = "Find Symbol" })

-- window management
map("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>h", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close Window" })

-- Buffer management
map("n", "<leader>bd", "<cmd>bufdo bd<CR>", { desc = "Close all buffers" })

-- Visual mode
map("v", ">", ">gv", { desc = "Indent" })

-- Debug
map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Continue" })

-- Trouble
map("n", "<leader>q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

-- Noice
map("n", "<leader>fn", "<cmd>Noice telescope<CR>", { desc = "Telescope (Notify)" })
map("n", "<leader>fN", "<cmd>messages<CR>", { desc = "Native messages (includes startup)" })

-- NvimTree
local function is_nvim_tree_focused()
	local bufname = vim.api.nvim_buf_get_name(0)
	return bufname:match("NvimTree_") ~= nil
end

local function toggle_or_focus_nvim_tree()
	if is_nvim_tree_focused() then
		require("nvim-tree.api").tree.toggle({ find_file = true })
	else
		require("nvim-tree.api").tree.open()
	end
end

map("n", "<leader>e", toggle_or_focus_nvim_tree, { noremap = true, silent = true })

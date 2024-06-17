require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

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
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>wh", "<cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close Window" })

-- Buffer management
map("n", "<leader>bd", "<cmd>bufdo bd<CR>", { desc = "Close all buffers" })

-- Visual mode
map("v", ">", ">gv", { desc = "Indent" })

-- debugg
map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Continue" })

-- trouble
-- map
map("n", "<leader>q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
-- map("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
-- map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
-- map(
-- 	"n",
-- 	"<leader>cl",
-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
-- 	{ desc = "LSP Definitions / references / ... (Trouble)" }
-- )
-- map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
-- map("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Noice
map("n", "<leader>tn", "<cmd>Telescope notify<CR>", { desc = "Telescope (Notify)" })

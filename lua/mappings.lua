require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Normal mode
map("n", ";", ":", { desc = "Enter command mode", nowait = true })
-- Lazy
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazy Git" })
map("n", "<leader>ld", ":Lazydocker<CR>", { desc = "Lazy Docker" })
--Aerial
map("n", "<leader>o", ":AerialToggle!<CR>", { desc = "Aerial Toggle" })
map("n", "{", ":AerialPrev<CR>", { desc = "Aerial Prev" })
map("n", "}", ":AerialNext<CR>", { desc = "Aerial Next" })
map("n", "<leader>fo", ":Telescope aerial<CR>", { desc = "Find Symbol" })
-- window management
map("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>wh", ":split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wx", ":close<CR>", { desc = "Close Window" })

-- Visual mode
map("v", ">", ">gv", { desc = "Indent" })


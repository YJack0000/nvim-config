require "nvchad.mappings"

local map = vim.keymap.set

-- Normal mode
map("n", ";", ":", { desc = "Enter command mode", nowait = true })
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazy Git" })
map("n", "<leader>ld", ":Lazydocker<CR>", { desc = "Lazy Docker" })
map("n", "<leader>o", ":AerialToggle!<CR>", { desc = "Aerial Toggle" })
map("n", "{", ":AerialPrev<CR>", { desc = "Aerial Prev" })
map("n", "}", ":AerialNext<CR>", { desc = "Aerial Next" })
map("n", "<leader>fo", ":Telescope aerial<CR>", { desc = "Find Symbol" })

-- Visual mode
map("v", ">", ">gv", { desc = "Indent" })


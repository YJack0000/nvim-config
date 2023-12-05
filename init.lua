-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- make tab into 4 spaces
vim.cmd("set tabstop=4")
-- make format use 4 spaces
vim.cmd("set shiftwidth=4")

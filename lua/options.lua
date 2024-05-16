require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- make tab into 4 spaces
vim.cmd("set tabstop=4")
-- make format use 4 spaces
vim.cmd("set shiftwidth=4")
-- make line number to relative
vim.cmd("set relativenumber")

-- set default shell to zsh if it exists
if vim.fn.executable("/usr/bin/zsh") == 1 then
	vim.o.shell = "/usr/bin/zsh"
end

-- local enable_providers = {
-- 	"python3_provider",
-- }
--
-- for _, plugin in pairs(enable_providers) do
-- 	vim.g["loaded_" .. plugin] = nil
-- 	vim.cmd("runtime " .. plugin)
-- end

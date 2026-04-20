require("nvchad.options")

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.relativenumber = true

if vim.fn.executable("zsh") == 1 then
	vim.o.shell = "zsh"
end

---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["<leader>gg"] = { ":LazyGit<CR>", "lazy git" },
    },
    v = {
        [">"] = { ">gv", "indent" },
    },
}

return M

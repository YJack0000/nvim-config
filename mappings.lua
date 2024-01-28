---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["<leader>gg"] = { ":LazyGit<CR>", "Lazy git" },
        -- ["<A-o>"] = { ":SymbolsOutline<CR>", "SymbolsOutline" }
    },
    v = {
        [">"] = { ">gv", "indent" },
    },
}

return M

---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["<leader>gg"] = { ":LazyGit<CR>", "Lazy git" },
        -- ["<A-o>"] = { ":SymbolsOutline<CR>", "SymbolsOutline" }
        ["<leader>o"] = { ":AerialToggle!<CR>", "Aerial Toggle" },
        ["{"] = { ":AerialPrev<CR>", "AerialPrev" },
        ["}"] = { ":AerialNext<CR>", "AerialNext" },
        ["<leader>fo"] = { ":Telescope aerial<CR>", "Find Symbol" },
    },
    v = {
        [">"] = { ">gv", "indent" },
    },
}

return M

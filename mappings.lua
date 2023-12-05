---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["<leader>lg"] = {
            function()
                require("nvterm").setup {
                    terminals = {
                        shell = vim.o.shell,
                        list = {},
                        type_opts = {
                            float = {
                                relative = "editor",
                                row = 0.1,
                                col = 0.1,
                                width = 0.8,
                                height = 0.8,
                                border = "single",
                            },
                            horizontal = { location = "rightbelow", split_ratio = 0.3 },
                            vertical = { location = "rightbelow", split_ratio = 0.5 },
                        },
                    },
                    behavior = {
                        autoclose_on_quit = {
                            enabled = false,
                            confirm = true,
                        },
                        close_on_exit = true,
                        auto_insert = true,
                    },
                }

                local terminal = require("nvterm.terminal")
                terminal.send("lazygit", "float")
                terminal.toggle "float"
                terminal.toggle "float"
            end,
            "Toggle lazygit",
        },
    },
    v = {
        [">"] = { ">gv", "indent" },
    },
}

return M

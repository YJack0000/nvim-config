local function refresh_nvim_tree()
    require("nvim-tree.api").tree.reload()
end

local function setup_lazygit_autocmds()
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*lazygit*",
        callback = function()
            vim.api.nvim_create_autocmd("BufDelete", {
                pattern = "<buffer>",
                callback = refresh_nvim_tree,
            })
        end,
    })
end

return {
    setup = setup_lazygit_autocmds,
}

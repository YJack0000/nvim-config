---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
	theme = "github_dark",
	theme_toggle = { "github_dark", "github_dark" },

	hl_override = highlights.override,
	hl_add = highlights.add,
	lsp = {
		signature = true,
	},

	tabufline = {
		-- order = { "treeOffset", "buffers", "tabs", "btns"},
		order = { "treeOffset", "buffers", "tabs"},
        -- enabled = false,
		modules = {
			-- You can add your custom component
		},
	},
}

return M

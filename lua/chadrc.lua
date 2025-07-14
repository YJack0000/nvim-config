---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
	lsp = {
		signature = true,
	},
	tabufline = {
		-- order = { "treeOffset", "buffers", "tabs", "btns"},
		order = { "treeOffset", "buffers", "tabs" },
		-- enabled = false,
		modules = {
			-- You can add your custom component
		},
	},
}

M.base46 = {
	theme = "github_dark",
	theme_toggle = { "github_dark", "one_light" },
	hl_override = highlights.override,
	hl_add = highlights.add,
}

return M

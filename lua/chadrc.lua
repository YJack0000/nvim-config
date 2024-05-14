---@type ChadrcConfig
local M = {}

local highlights = require("highlights")

M.ui = {
	theme = "github_dark",
	theme_toggle = { "github_dark", "github_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,
}

return M

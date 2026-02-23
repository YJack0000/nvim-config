local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"clangd",
	"tailwindcss",
	-- "eslint",
	"volar",
	"dockerls",
	"docker_compose_language_service",
	"prismals",
}

capabilities.offsetEncoding = { "utf-16", "utf-8" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.ts_ls.setup({
	on_attach = function(client, _)
		-- prevent formatting with ts_ls conflicts with eslint_d
		if client.name == "ts_ls" then
			client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		end
		-- rest of the initialization
	end,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

-- lspconfig.basedpyright.setup({
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
-- })


local auto_group = vim.api.nvim_create_augroup("LspFormatting", {})
lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/codeAction") then
			vim.api.nvim_clear_autocmds({
				group = auto_group,
				buffer = bufnr,
			})
			vim.api.nvim_create_augroup("BufWritePre", {
				group = auto_group,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	on_init = on_init,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				target = "aarch64-unknown-none-softfloat",
			},
		},
	},
})

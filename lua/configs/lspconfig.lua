local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

capabilities.offsetEncoding = { "utf-16", "utf-8" }

local servers = {
	"html",
	"cssls",
	"clangd",
	"tailwindcss",
	"dockerls",
	"docker_compose_language_service",
	"prismals",
	"pyright",
}

local per_server_settings = {
	tailwindcss = {
		settings = {
			tailwindCSS = {
				files = {
					exclude = {
						"**/.git/**",
						"**/node_modules/**",
						"**/.claude/**",
						"**/.next/**",
						"**/dist/**",
						"**/build/**",
					},
				},
			},
		},
	},
}

for _, lsp in ipairs(servers) do
	local cfg = {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	}
	if per_server_settings[lsp] then
		cfg = vim.tbl_deep_extend("force", cfg, per_server_settings[lsp])
	end
	vim.lsp.config(lsp, cfg)
	vim.lsp.enable(lsp)
end

vim.lsp.config("ts_ls", {
	on_attach = function(client, _)
		if client.name == "ts_ls" then
			client.server_capabilities.documentFormattingProvider = false
		end
	end,
	on_init = on_init,
	capabilities = capabilities,
})
vim.lsp.enable("ts_ls")

local auto_group = vim.api.nvim_create_augroup("LspFormatting", {})
vim.lsp.config("gopls", {
	on_attach = function(client, bufnr)
		if client:supports_method("textDocument/codeAction") then
			vim.api.nvim_clear_autocmds({
				group = auto_group,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
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
	root_markers = { "go.mod", ".git" },
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
vim.lsp.enable("gopls")

vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json" },
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
vim.lsp.enable("rust_analyzer")

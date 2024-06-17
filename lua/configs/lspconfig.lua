local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"tailwindcss",
	"eslint",
	"volar",
	"dockerls",
	"docker_compose_language_service",
}

capabilities.offsetEncoding = { "utf-16", "utf-8" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- lspconfig.pyright.setup({
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
--   root_dir = function(fname)
--     return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
--       util.path.dirname(fname)
--   end,
-- 	single_file_support = true,
-- 	settings = {
-- 		pyright = {
-- 			disableLanguageServices = false,
-- 			disableOrganizeImports = false,
-- 		},
-- 		python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				typeCheckingMode = "standard",
-- 				useLibraryCodeForTypes = true,
-- 			},
-- 		},
-- 	},
-- })

-- lspconfig.pylsp.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.pylyzer.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

lspconfig.jedi_language_server.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

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

local util = require("lspconfig/util")
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

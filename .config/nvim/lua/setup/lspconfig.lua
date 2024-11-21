local function setup()
	local cmp_loaded, cmp_capabilities = pcall(require, "cmp_nvim_lsp")
	local lsp_loaded, lspconfig = pcall(require, "lspconfig")

	if not cmp_loaded and lsp_loaded then
		return
	end

	local default_capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = cmp_capabilities.default_capabilities(default_capabilities)

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = {
					globals = { "vim", "require" },
				},
				format = {
					enable = true,
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	}) -- lua

	lspconfig.eslint.setup({})
	lspconfig.ruby_lsp.setup({})
	lspconfig.gopls.setup({})
	lspconfig.rust_analyzer.setup({})
	lspconfig.ts_ls.setup({})

	lspconfig.jsonls.setup({
		capabilities = capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	}) -- json

	lspconfig.intelephense.setup({})
end

return { setup = setup }

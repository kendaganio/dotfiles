return {
	-- lspconfig + mason + null_ls
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"b0o/schemastore.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"jsonls",
					"tsserver",
					"rust_analyzer",
				},
			})
			require("setup.lspconfig").setup()
		end,
	},
	-- cmp and friends
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"honza/vim-snippets",
		},
		config = function()
			require("setup.cmp").setup()
		end,
	},
}

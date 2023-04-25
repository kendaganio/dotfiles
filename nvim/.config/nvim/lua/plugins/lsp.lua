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
					"eslint",
					"rust_analyzer",
					"gopls",
				},
			})
			require("setup.lspconfig").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {},
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
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("setup.cmp").setup()
		end,
	},
}

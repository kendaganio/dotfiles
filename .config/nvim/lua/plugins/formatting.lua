local react = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } }

return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			format_on_save = {
				timeout_ms = 800,
				lsp_fallback = false,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = react,
				javascriptreact = react,
				typescript = react,
				typescriptreact = react,
				go = { "gofmt" },
				json = { "prettierd", "prettier" },
				fish = { "fish_indent" },
				php = { "php_cs_fixer" },
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.phpcs,
					null_ls.builtins.diagnostics.phpstan,
					require("none-ls.diagnostics.eslint_d"),
				},
			})
		end,
	},
}

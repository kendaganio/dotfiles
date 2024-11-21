return {
	{
		"leoluz/nvim-dap-go",
		event = "VeryLazy",
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{ "<leader><leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
			{ "<leader><leader>dt", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP ui" },
		},
		config = function()
			require("setup.dap").setup()
		end,
	},
}

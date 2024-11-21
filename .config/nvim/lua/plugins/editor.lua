return {
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },
	{
		"nvim-pack/nvim-spectre",
		event = "VeryLazy",
		keys = {
			{ "<leader>cs", "<cmd> lua require('spectre').open()<cr>", desc = "Open spectre" },
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"phaazon/hop.nvim",
		event = "BufEnter",
		branch = "v2",
		keys = {
			{ "gw", "<cmd>HopWord<cr>", desc = "Hop by word" },
			{ "<leader><leader>w", "<cmd>HopWordAC<cr>", desc = "Hop by word forward" },
			{ "<leader><leader>b", "<cmd>HopWordBC<cr>", desc = "Hop by word back" },
			{ "<leader><leader>l", "<cmd>HopLine<cr>", desc = "Hop by line" },
		},
		opts = { keys = "etovxqpdygfblzhckisuran" },
	},
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VimEnter",
		opts = {
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-Space>",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("setup.telescope").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag",
			"HiPhish/rainbow-delimiters.nvim",
		},
		config = function()
			require("nvim-autopairs").setup()
			require("nvim-ts-autotag").setup()
			require("setup.treesitter").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		config = function()
			require("setup.which_key").setup()
		end,
	},
}

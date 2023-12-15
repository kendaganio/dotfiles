-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = "," -- leader key
vim.o.termguicolors = true -- full color in terminal

-- Bootstrap lazy vim
require("config.bootstrap")

-- Load plugins
require("lazy").setup("plugins", {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Others
require("config.options")

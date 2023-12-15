local function setup()
	local ts_loaded, treesitter = pcall(require, "nvim-treesitter.configs")
	local rainbow_loaded, rainbow_delimiters = pcall(require, "rainbow-delimiters")

	if not ts_loaded then
		return
	end

	treesitter.setup({
		ensure_installed = {
			"bash",
			"c",
			"commonlisp",
			"css",
			"dart",
			"dockerfile",
			"fish",
			"go",
			"gomod",
			"gosum",
			"gowork",
			"graphql",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"python",
			"regex",
			"ruby",
			"rust",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		autotag = { enable = true },
		endwise = { enable = true },
	})

	vim.g.rainbow_delimiters = {
		strategy = {
			[""] = rainbow_delimiters.strategy["global"],
			vim = rainbow_delimiters.strategy["local"],
		},
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
		},
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		},
	}
end

return { setup = setup }

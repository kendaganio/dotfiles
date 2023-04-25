local function setup()
	local loaded, treesitter = pcall(require, "nvim-treesitter.configs")
	if not loaded then
		return
	end

	treesitter.setup({
		ensure_installed = {
			"bash",
			"commonlisp",
			"css",
			"dart",
			"dockerfile",
			"fish",
			"go",
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
		rainbow = { enable = true, extended_mode = true },
	})
end

return { setup = setup }

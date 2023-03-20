return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					local results = "#282c42"
					results = "#0f111c"
					results = "#1d2033"
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = c.red,
						fg = c.bg_dark,
					}

					hl.TelescopePreviewTitle = {
						bg = c.green,
						fg = c.bg_dark,
					}
					hl.TelescopePreviewNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopePreviewBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}

					hl.TelescopeResultsBorder = {
						bg = results,
						fg = results,
					}
					hl.TelescopeResultsTitle = {
						bg = results,
						fg = results,
					}
					hl.TelescopeResultsNormal = {
						bg = results,
						fg = c.fg_dark,
					}
				end,
			})
		end,
	},
	{ "jrudess/vim-foldtext", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				cmdline = {
					opts = {
						position = "50%",
					},
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_end_of_line = true,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					section_separators = { left = "", right = "" },
					component_separators = "",
				},
			})
		end,
	},
}

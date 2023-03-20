local function setup()
	local wk_loaded, wk = pcall(require, "which-key")
	if not wk_loaded then
		return
	end

	wk.setup({
		triggers_blacklist = {
			i = { "j", "k", "f", "s" },
			v = { "j", "k", "f", "s" },
		},
	})

	wk.register({
		["fp"] = { "<esc>", "escape" },
		["jk"] = { "<esc>", "escape" },
	}, { mode = "i" })

	wk.register({
		["<c-p>"] = { "<cmd>Telescope fd<cr>", "Open files" },
		["<c-n>"] = { "<cmd>bnext<cr>", "Next buffer" },
		["-?"] = {
			function()
				local previous_buf = vim.api.nvim_get_current_buf()
				require("nvim-tree").open_replacing_current_buffer()
				require("nvim-tree.api").tree.find_file(previous_buf)
			end,
			"NvimTree in place",
		},
		["-"] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser in current dir" },
		-- single key leader maps
		["<leader>d"] = { "<cmd>Telescope file_browser<cr>", "File browser..." },
		["<leader>w"] = { "<cmd>w<cr>", "Save file..." },
		["<leader>x"] = { "<cmd>bd<cr>", "Kill buffer..." },
		["<leader>q"] = { "<cmd>q!<cr>", "Force quit windows..." },
		["<leader>r"] = { "<cmd>Telescope live_grep<cr>", "Live grepper ..." },
		["<leader>b"] = { "<cmd>Telescope buffers<cr>", "Show buffers ..." },
		["<leader>gb"] = { "<cmd>Git blame<cr>", "Show git blame..." },
		["<leader><leader>x"] = { "<cmd>bufdo bd<cr>", "Kill *ALL* buffers..." },
		["<leader><leader>q"] = { "<cmd>qa!<cr>", "Quit *ALL* windows..." },
		["<leader><leader>w"] = { "<cmd>HopWordAC<cr>", "Easymotion word-wise..." },
		["<leader><leader>b"] = { "<cmd>HopWordBC<cr>", "Easymotion word-wise..." },
		["gw"] = { "<cmd>HopWordAC<cr>", "Easymotion word-wise..." },
		["gl"] = { "<cmd>HopLine<cr>", "Easymotion word-wise..." },
		-- buffer controls
		["n"] = { "nzz", "move to the next but center" },
		["N"] = { "Nzz", "move to the prev but center" },
		["vv"] = { "<C-w>v", "Split vertically..." },
		["//"] = { "<cmd>:nohlsearch<cr>", "Remove search highlight..." },
		["<leader>s"] = { name = "Settings..." },
		["<leader>sc"] = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
		["<leader>si"] = { "<cmd>e $MYVIMRC<cr>", "Edit init.lua" },
		["<leader>sr"] = { "<cmd>luafile $MYVIMRC<cr>", "Reload settings" },
		["<leader>p"] = { name = "Pick..." },
		["<leader>pf"] = { "<cmd>Telescope fd<cr>", "Open files..." },
		["<leader>c"] = { name = "Code..." },
		["<leader>cd"] = { "<cmd>Telescope diagnostics<cr>", "Show errors..." },
		["<leader>ca"] = { vim.lsp.buf.code_action, "Code actions..." },
		["<leader>cr"] = { vim.lsp.buf.rename, "Rename symbol..." },
		["gD"] = { vim.lsp.buf.declaration, "Declaration (lsp)..." },
		["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Definitions (lsp)..." },
		["K"] = { vim.lsp.buf.hover, "Show hover (lsp)" },
		["gi"] = { vim.lsp.buf.implementation, "Implementation (lsp)..." },
		["gr"] = { "<cmd>Telescope lsp_references<cr>", "References (lsp)..." },
	})
end

return { setup = setup }

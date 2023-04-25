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
		["-"] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser in current dir" },
		-- single key leader maps
		["<leader>d"] = { "<cmd>Telescope file_browser<cr>", "File browser..." },
		["<leader>w"] = { "<cmd>w<cr>", "Save file..." },
		---
		["<leader>x"] = { "<cmd>Bdelete<cr>", "Kill buffer..." },
		["<leader><leader>x"] = { "<cmd>Bwipeout<cr>", "Kill *ALL* buffers..." },
		["<leader>q"] = { "<cmd>q!<cr>", "Force quit windows..." },
		["<leader><leader>q"] = { "<cmd>qa!<cr>", "Quit *ALL* windows..." },
		["<leader><leader>c"] = { "<cmd>cclose<cr>", "Close quickfix" },
		---
		["<leader>r"] = { "<cmd>Telescope live_grep<cr>", "Live grepper ..." },
		["<leader>b"] = { "<cmd>Telescope buffers<cr>", "Show buffers ..." },
		["<leader>gb"] = { "<cmd>Git blame<cr>", "Show git blame..." },
		-- buffer controls
		["n"] = { "nzz", "move to the next but center" },
		["N"] = { "Nzz", "move to the prev but center" },
		["vv"] = { "<C-w>v", "Split vertically..." },
		["//"] = { "<cmd>:nohlsearch<cr>", "Remove search highlight..." },
		["<leader>s"] = { name = "Settings..." },
		["<leader>si"] = { "<cmd>e $MYVIMRC<cr>", "Edit init.lua" },
		["<leader>sf"] = { "<cmd>e ~/.config/fish/config.fish<cr>", "Edit config.fish" },
		["<leader>sr"] = { "<cmd>luafile $MYVIMRC<cr>", "Reload settings" },
		["<leader>p"] = { name = "Pick..." },
		["<leader>pf"] = { "<cmd>Telescope fd<cr>", "Open files..." },
		["<leader>c"] = { name = "Code..." },
		["<leader>cd"] = { "<cmd>Telescope diagnostics<cr>", "Show errors..." },
		["<leader>ct"] = { "<cmd>TroubleToggle<cr>", "Show diganostics..." },
		["<leader>ca"] = { vim.lsp.buf.code_action, "Code actions..." },
		["<leader>cr"] = { vim.lsp.buf.rename, "Rename symbol..." },
		["gl"] = { vim.diagnostic.open_float, "Diagnostic float (lsp)..." },
		["gD"] = { vim.lsp.buf.declaration, "Declaration (lsp)..." },
		["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Definitions (lsp)..." },
		["K"] = { vim.lsp.buf.hover, "Show hover (lsp)" },
		["gi"] = { vim.lsp.buf.implementation, "Implementation (lsp)..." },
		["gr"] = { "<cmd>Telescope lsp_references<cr>", "References (lsp)..." },
	})
end

return { setup = setup }

local function setup()
	local wk_loaded, wk = pcall(require, "which-key")
	if not wk_loaded then
		return
	end

	wk.add({
    -- escapes
    { "fp", "<esc>", desc = "escape", mode = "i" },
    { "jk", "<esc>", desc = "escape", mode = "i" },
    -- single key leader maps
    { "<leader>d", "<cmd>Telescope file_browser<cr>", desc = "File browser..." },
    { "<leader>w", "<cmd>w<cr>", desc = "Save file..." },
    -- 
    { "<leader>x", "<cmd>Bdelete<cr>", desc = "Kill buffer..." },
    { "<leader><leader>x", "<cmd>Bwipeout<cr>", desc = "Kill *ALL* buffers..." },
    { "<leader>q", "<cmd>q!<cr>", desc = "Force quit windows..." },
    { "<leader><leader>q", "<cmd>qa!<cr>", desc = "Quit *ALL* windows..." },
    { "<leader><leader>c", "<cmd>cclose<cr>", desc = "Close quickfix" },
    -- telescope
    { "-", "<cmd>Telescope file_browser path=%:p:help |select_buffer=true<cr>|", desc = "File browser in current dir" },
    { "<leader>r", "<cmd>Telescope live_grep<cr>", desc = "Live grepper ..." },
    { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Show buffers ..." },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Show git blame..." },
    -- buffers
    { "n", "nzz", desc = "move to the next but center" },
    { "N", "Nzz", desc = "move to the prev but center" },
    { "vv", "<C-w>v", desc = "Split vertically..." },
    { "//", "<cmd>:nohlsearch<cr>", desc = "Remove search highlight..." },
    -- settings
    { "<leader>s", group = "Settings..." },
    { "<leader>si", "<cmd>e $MYVIMRC<cr>", desc = "Edit init.lua" },
    { "<leader>sf", "<cmd>e ~/.config/fish/config.fish<cr>", desc = "Edit config.fish" },
    { "<leader>sr", "<cmd>luafile $MYVIMRC<cr>", desc = "Reload settings" },
    --code
    { "<leader>c", group = "Code..." },
    -- pickers 
    { "<leader>p", group = "Pick..." },
    { "<leader>pf", "<cmd>Telescope fd<cr>", desc = "Open files..." },
    { "<c-p>", "<cmd>Telescope fd<cr>", desc = "Open files" },
    { "<c-n>", "<cmd>bnext<cr>", desc = "Next buffer" },
    --lsp
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions..." },
    { "<leader>cd", "<cmd>Telescope diagnostics<cr>", desc = "Show errors..." },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename symbol..." },
    { "<leader>ct", "<cmd>Trouble diagnostics<cr>", desc = "Show diganostics..." },
    { "K", vim.lsp.buf.hover, desc = "Show hover (lsp)" },
    { "gD", vim.lsp.buf.declaration, desc = "Declaration (lsp)..." },
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions (lsp)..." },
    { "gi", vim.lsp.buf.implementation, desc = "Implementation (lsp)..." },
    { "gl", vim.diagnostic.open_float, desc = "Diagnostic float (lsp)..." },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References (lsp)..." },
  })
end

return { setup = setup }

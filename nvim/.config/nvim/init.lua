-- Install Packer on first run
local pack_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(pack_path)) > 0 then
  vim.cmd([[echo "Installing packer..."]])
  vim.g.firstrun = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", pack_path })
  vim.defer_fn(function()
    vim.cmd("luafile " .. vim.env.MYVIMRC)
  end, 1)
  return
end

-- Initialise packer
require("packer").startup(function(use)
  -- Package Manager
  use("wbthomason/packer.nvim")

  -- Basics
  use("lewis6991/impatient.nvim") -- Improve startup time by optimising Lua cache
  use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }) -- Nvim Tree
  use({ "alexghergh/nvim-tmux-navigation", config = function()
	  require'nvim-tmux-navigation'.setup {
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      }
    }
  end})
  use({ "phaazon/hop.nvim", branch = 'v2' })
  use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }) -- Pick files and more
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter
  use("folke/which-key.nvim")

  -- LSP
  use("neovim/nvim-lspconfig") -- Configure LSP
  use("williamboman/mason.nvim") -- Install LSP servers (:Mason)
  use("williamboman/mason-lspconfig.nvim")
  use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-nvim-lsp" } })

  -- Pretty Stuff
  use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- Status line
  use("folke/tokyonight.nvim")
  use("lukas-reineke/indent-blankline.nvim")

  -- Katamaran
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
end)

-- Auto-install packages on first run
if vim.g.firstrun then
  vim.g.firstrun = nil
  vim.cmd("autocmd User PackerCompileDone luafile " .. vim.env.MYVIMRC)
  require("packer").sync()
  return
end

require("impatient") -- Optimise lua cache

-- Vim configuration
vim.g.mapleader = "," -- leader key
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a" -- mouse support
vim.o.number = true -- line numbers
vim.o.swapfile = false -- no swap file
vim.o.termguicolors = true -- full color in terminal
vim.o.timeoutlen = 200
vim.o.undofile = false -- no undo file
vim.o.wrap = false -- no word wrap

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cc = 80
vim.o.cursorline = true -- add cursor line

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.cmd([[color tokyonight]])

-- LSP installer
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua-language-server",
    "html",
    "jsonls",
    "tsserver",
    "solargraph",
  }
})

require("nvim-autopairs").setup()
require("lualine").setup()
require('indent_blankline').setup({
  show_current_context = true,
  show_end_of_line = true,
})

-- Treesitter
-- Adding languages to `ensure_installed` improves syntax highlighting and more.
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "html",
    "json",
    "lua",
    "vim",
    "css",
    -- "go",
    "javascript",
    "typescript",
    "tsx",
    -- "markdown",
    -- "php",
    "python",
    "ruby",
    "rust",
    "typescript",
    -- ...for more, see: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  },
  highlight = { enable = true },
  autotag = { enable = true }
})

-- LSPConfig
-- These enable advanced features (go to definition, hover, error checking, etc)
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}) -- lua

-- lspconfig.cssls.setup({}) -- css
-- lspconfig.pylsp.setup({}) -- python
-- lspconfig.pyright.setup({}) -- python type checking
-- lspconfig.solargraph.setup({}) -- ruby
lspconfig.tsserver.setup({}) -- javascript and typescript
-- ...for more, see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Telescope
require("telescope").setup({
  pickers = {
    fd = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
    buffers = { theme = "dropdown" },
  }
})
require("telescope").load_extension("fzf")

require("hop").setup({ keys = 'etovxqpdygfblzhckisuran' })

-- Nvim Tree - empty setup using defaults
require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true
    }
  }
})

-- Key bindings
vim.keymap.set("i", "fp", "<esc>", {})
vim.keymap.set("i", "jk", "<esc>", {})

require("which-key").setup({})
require("which-key").register({
  ["<c-p>"] = { "<cmd>Telescope fd<cr>", "Open files" },
  ["<c-n>"] = { "<cmd>:bnext<cr>", "Next buffer" },

  -- single key leader maps
  ["<leader>d"] = { "<cmd>:NvimTreeToggle<cr>", "Toggle nvim-tree..." },
  ["<leader>w"] = { "<cmd>:w<cr>", "Save file..." },
  ["<leader>x"] = { "<cmd>:bd<cr>", "Kill buffer..." },
  ["<leader>q"] = { "<cmd>:q!<cr>", "Force quit windows..." },
  ["<leader>r"] = { "<cmd>:Telescope live_grep<cr>", "Live grepper ..." },
  ["<leader>b"] = { "<cmd>:Telescope buffers<cr>", "Show buffers ..." },
  ["<leader><leader>x"] = { "<cmd>:bufdo bd<cr>", "Kill *ALL* buffers..." },
  ["<leader><leader>q"] = { "<cmd>:qa!<cr>", "Quit *ALL* windows..." },
  ["<leader><leader>w"] = { "<cmd>HopWordAC<cr>", "Easymotion word-wise..." },
  ["<leader><leader>b"] = { "<cmd>HopWordBC<cr>", "Easymotion word-wise..." },

  -- buffer controls
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
  ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions..." },
  ["<leader>cr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol..." },

  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration (lsp)..." },
  ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Definitions (lsp)..." },
  ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover (lsp)" },
  ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation (lsp)..." },
  ["gr"] = { "<cmd>Telescope lsp_references<cr>", "References (lsp)..." },
})

-- Completion
local cmp = require("cmp")
require("cmp").setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  }, {
    { name = "buffer"},
  }),

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
})


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
  use({ "wbthomason/packer.nvim" })

  -- Basics
  use({ "lewis6991/impatient.nvim" })                                            -- Improve startup time by optimising Lua cache
  use({ "tpope/vim-fugitive" })
  use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }) -- Nvim Tree
  use({
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require 'nvim-tmux-navigation'.setup {
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
  })
  use({ "phaazon/hop.nvim", branch = 'v2' })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    }
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "RRethy/nvim-treesitter-endwise",
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-autopairs",
      "windwp/nvim-ts-autotag"
    },
    run = ":TSUpdate"
  })

  use({ "folke/which-key.nvim", commit = "25e0e7f323c43ebe4d0b8df61b4996dba2f89222" })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "b0o/schemastore.nvim"
    }
  })
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "honza/vim-snippets"
    }
  })
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- Pretty Stuff
  use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- Status line
  use({ "folke/tokyonight.nvim" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "jrudess/vim-foldtext" })
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
vim.o.autoread = true
vim.o.mouse = "a"          -- mouse support
vim.o.number = true        -- line numbers
vim.o.swapfile = false     -- no swap file
vim.o.termguicolors = true -- full color in terminal
vim.o.timeoutlen = 200
vim.o.undofile = false     -- no undo file
vim.o.wrap = false         -- no word wrap

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cc = 80
vim.o.cursorline = true -- add cursor line

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.opt.list = true
vim.opt.listchars:append "eol:↵"

vim.cmd([[color tokyonight]])
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevelstart = 1

vim.cmd("autocmd BufNewFile,BufRead *.jbuilder set ft=ruby")

-- LSP installer
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "html",
    "jsonls",
    "tsserver",
    -- "solargraph",
    -- "gopls",
    "rust_analyzer"
  }
})

require("nvim-autopairs").setup()
require("lualine").setup()
require('indent_blankline').setup({
  show_current_context = true,
  show_end_of_line = true,
})

require("hop").setup({ keys = 'etovxqpdygfblzhckisuran' })

-- Nvim Tree - empty setup using defaults
require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "<cr>", action = "edit_in_place" }
      }
    },
  },
  actions = {
    change_dir = {
      enable = false
    }
  },
  renderer = {
    indent_markers = {
      enable = true
    }
  }
})

local winopts = require("nvim-tree.view").View.winopts
winopts.winfixwidth = false
winopts.winfixheight = false

require("setup.which_key").setup()
require("setup.telescope").setup()
require("setup.cmp").setup()
require("setup.treesitter").setup()
require("setup.lspconfig").setup()

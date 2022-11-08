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
  use({ "lewis6991/impatient.nvim" }) -- Improve startup time by optimising Lua cache
  use({ "tpope/vim-fugitive" })
  use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }) -- Nvim Tree
  use({ "alexghergh/nvim-tmux-navigation", config = function()
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
  end })
  use({ "phaazon/hop.nvim", branch = 'v2' })
  use({ "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = {
      require("setup.telescope").setup()
    }
  })

  use({ "nvim-treesitter/nvim-treesitter",
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
  use({ "neovim/nvim-lspconfig", requires = {
    "b0o/schemastore.nvim"
  } }) -- Configure LSP
  use({ "williamboman/mason.nvim" }) -- Install LSP servers (:Mason)
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "hrsh7th/nvim-cmp", requires = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "honza/vim-snippets"
  } })
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
vim.opt.listchars:append "eol:↵"

vim.cmd([[color tokyonight]])
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

vim.cmd("autocmd BufNewFile,BufRead *.jbuilder set ft=ruby")

-- LSP installer
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "html",
    "jsonls",
    "tsserver",
    "solargraph",
    "gopls",
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

-- Key bindings
require("which-key").setup({
  triggers_blacklist = {
    i = { "j", "k", "f", "s" },
    v = { "j", "k", "f", "s" },
  }
})

require("which-key").register({
  ["fp"] = { "<esc>", "escape" },
  ["jk"] = { "<esc>", "escape" },
}, { mode = "i" })

require("which-key").register({
  ["<c-p>"] = { "<cmd>Telescope fd<cr>", "Open files" },
  ["<c-n>"] = { "<cmd>bnext<cr>", "Next buffer" },

  ["-"] = {
    function()
      local previous_buf = vim.api.nvim_get_current_buf()
      require("nvim-tree").open_replacing_current_buffer()
      require("nvim-tree").find_file(false, previous_buf)
    end,
    "NvimTree in place",
  },

  -- single key leader maps
  ["<leader>d"] = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim-tree..." },
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
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

require("cmp").setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50
    })
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
})

require("cmp").setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

require("cmp").setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require("setup.treesitter").setup()
require("setup.lspconfig").setup()

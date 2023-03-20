return {
  { "lewis6991/impatient.nvim" },
  { "tpope/vim-fugitive",           event = "BufEnter" },
  { "windwp/nvim-spectre",          lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    branch = "v2",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup({
        view = {
          mappings = {
            list = {
              { key = "<cr>", action = "edit_in_place" },
            },
          },
        },
        actions = {
          change_dir = {
            enable = false,
          },
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
        },
      })

      local winopts = require("nvim-tree.view").View.winopts
      winopts.winfixwidth = false
      winopts.winfixheight = false
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VimEnter",
    config = function()
      require("nvim-tmux-navigation").setup({
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("setup.telescope").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-autopairs",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-autopairs").setup()
      require("setup.treesitter").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      require("setup.which_key").setup()
    end,
  },
}

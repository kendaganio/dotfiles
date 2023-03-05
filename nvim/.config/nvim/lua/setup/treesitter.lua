local function setup()
  local loaded, treesitter = pcall(require, "nvim-treesitter.configs")
  if not loaded then return end

  treesitter.setup({
      ensure_installed = {
          "dart",
          "html",
          "json",
          "lua",
          "vim",
          "css",
          "go",
          "javascript",
          "typescript",
          "tsx",
          "markdown",
          "python",
          "ruby",
          "rust",
          "typescript",
          "fish",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      endwise = { enable = true },
      rainbow = { enable = true, extended_mode = true }
  })
end

return { setup = setup }

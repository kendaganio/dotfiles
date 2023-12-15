local function setup()
  local loaded, telescope = pcall(require, "telescope")
  if not loaded then
    return
  end

  telescope.setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = " 🔍  ",
      selection_caret = "  ",
      -- entry_prefix = "  ",
      -- initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      color_devicons = true,
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },
    extensions = {
      file_browser = {
        initial_mode = "normal",
        hijack_netrw = true,
        hidden = true, -- show hidden files
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("file_browser")
end

return { setup = setup }

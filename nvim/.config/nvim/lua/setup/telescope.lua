local function setup()
  local loaded, telescope = pcall(require, "telescope")
  if not loaded then return end

  telescope.setup({
    defaults = require('telescope.themes').get_dropdown {
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      layout_config = {
        width = 0.6,
      }
    },
    extensions = {
      file_browser = {
        initial_mode = "normal",
        hijack_netrw = true,
        hidden = true, -- show hidden files
        theme = "ivy",
        layout_config = {
          height = 0.7,
        }
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("file_browser")
end

return { setup = setup }

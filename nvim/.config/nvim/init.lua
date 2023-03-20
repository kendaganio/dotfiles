-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = "," -- leader key

-- Load all plugins
require("config.bootstrap")
require("lazy").setup("plugins")

-- Others
require("impatient") -- Optimise lua cache
require("config.options")

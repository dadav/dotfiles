-- Enable native caching
vim.loader.enable = true

-- Install the plugins
require("init_plugins")

-- Customize nvim
require("user")

-- Configure the plugins
require("plugins")

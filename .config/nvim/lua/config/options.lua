-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- use absolute numbers
opt.relativenumber = false

--  enable mouse support
opt.mouse = "a"

-- allow cursor to move where there is no text in visual block mode
opt.virtualedit = "block"

-- german,english
opt.spelllang = "de,en"

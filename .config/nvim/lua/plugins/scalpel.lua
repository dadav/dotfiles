local ok, _ = pcall(require, "scalpel")
if not ok then
  return
end

-- Disable default mappings
vim.g.ScalpelMap = 0

-- Bind to <leader>r
vim.api.nvim_set_keymap("n", "<leader>s", "<Plug>(Scalpel)", { desc = "[s]calpel", noremap = true, silent = false })

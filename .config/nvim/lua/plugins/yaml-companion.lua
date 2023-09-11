local ok, _ = pcall(require, "yaml-companion")
if not ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>tj", '<cmd>:Telescope yaml_schema<CR>',
  { desc = "[J]sonschemas", noremap = true, silent = true })

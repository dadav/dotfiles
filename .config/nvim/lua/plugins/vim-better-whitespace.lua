-- Strip whitespace
vim.g.strip_whitespace_on_save = 1

-- but not when ft=markdown
vim.cmd([[
  augroup markdown_file_changed
    au!
    au FileType markdown DisableStripWhitespaceOnSave
    au TermOpen * DisableWhitespace
  augroup end
]])

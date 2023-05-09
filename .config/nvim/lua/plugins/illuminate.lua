local ok, ilu = pcall(require, "illuminate")

if not ok then
	return
end

ilu.configure({
	min_count_to_highlight = 2,
	filetypes_denylist = { "NvimTree" },
	under_cursor = false,
})

vim.cmd([[
  augroup illuminate_augroup
    au!
    au VimEnter * hi IlluminatedWordText gui=undercurl guisp=LightGrey
    au VimEnter * hi IlluminatedWordRead gui=undercurl guisp=LightGrey
    au VimEnter * hi IlluminatedWordWrite gui=undercurl guisp=LightGrey
  augroup end
]])

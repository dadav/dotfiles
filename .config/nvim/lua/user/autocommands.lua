vim.cmd([[
  augroup _general_settings
    au!
    au FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    au TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 500})
    au BufWinEnter * :set formatoptions-=cro
  augroup end

  augroup _git
    au!
    au FileType gitcommit setlocal wrap
    au FileType gitcommit setlocal spell
  augroup end


  augroup _markdown
    au!
    au FileType markdown setlocal wrap
    au FileType markdown setlocal spell
  augroup end

  augroup _python
    au!
    au BufNewFile,BufRead *.py set foldmethod=indent
  augroup end

  augroup _ansible
    au!
    au BufRead,BufNewFile */playbooks/*.y*ml set filetype=yaml.ansible
    au BufRead,BufNewFile */tasks/*.y*ml set filetype=yaml.ansible
    au BufRead,BufNewFile main.y*ml set filetype=yaml.ansible
  augroup end
]])

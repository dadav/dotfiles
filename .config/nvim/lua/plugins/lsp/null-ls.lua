local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    -- Formating
    -- formatting.stylua,
    -- formatting.black.with({ extra_args = { "--fast", "--line-length=120" } }),
    formatting.rustfmt,
    formatting.yamlfmt.with({
      extra_args = { "-formatter",
        "indent=2,include_document_start=true,retain_line_breaks=true,scan_folded_as_literal=true" }
    }),
    formatting.puppet_lint,
    formatting.goimports,
    formatting.goimports_reviser,
    formatting.golines,
    formatting.isort,

    -- Diagnostics
    diagnostics.shellcheck,
    diagnostics.ansiblelint,
    diagnostics.jsonlint,
    -- diagnostics.puppet_lint,
  },
})

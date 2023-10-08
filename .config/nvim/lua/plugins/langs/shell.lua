return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Harden, then check
        sh = { "shfmt", "shellharden", "shellcheck" },
      },
    },
  },
  -- Shell diagnostics
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          nls.builtins.diagnostics.shellcheck,
        })
      end
    end,
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- shell
        "shfmt",
        "shellcheck",
        "shellharden",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      -- delve is for go
      ensure_installed = { "bash" },
    },
  },
}

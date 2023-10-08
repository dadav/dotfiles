return {
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- shell
        "shfmt",
        "shellcheck",
        "shellharden",
        -- python
        "ruff",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      -- delve is for go
      ensure_installed = { "bash", "python", "delve", "puppet" },
    },
  },
}

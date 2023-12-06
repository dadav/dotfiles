return {
  -- Diagnostics
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonnet_ls = {
          cmd = { "jsonnet-language-server", "--tanka", "--eval-diags", "--lint", "-l", "debug" },
        },
      },
    },
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "jsonnet-language-server",
        "jsonnetfmt",
      })
    end,
  },
  -- Syntaxhighlight
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "jsonnet" })
      end
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        jsonnetfmt = {
          command = "jsonnetfmt",
          args = { "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        jsonnet = { "jsonnetfmt" },
      },
    },
  },
}

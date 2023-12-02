return {
  -- Diagnostics
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonnet_ls = {},
      },
    },
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "jsonnet-language-server",
        -- https://github.com/mason-org/mason-registry/pull/3652
        -- "jsonnetfmt"
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
          args = { "$FILENAME" },
        },
      },
      formatters_by_ft = {
        jsonnet = { "jsonnetfmt" },
      },
    },
  },
}

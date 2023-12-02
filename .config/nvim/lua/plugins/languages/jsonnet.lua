return {
  -- Diagnostics
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonnet_ls = {
          single_file_support = true,
          -- root_dir = function(fname)
          --   local util = require("lspconfig.util")
          --   return util.root_pattern("jsonnetfile.json")(fname) or util.find_git_ancestor(fname) or "."
          -- end,
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
          args = { "$FILENAME" },
        },
      },
      formatters_by_ft = {
        jsonnet = { "jsonnetfmt" },
      },
    },
  },
}

return {
  -- Autocompletion for kubernetes
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    opts = {
      builtin_matchers = {
        kubernetes = { enabled = true },
      },
    },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function(_, opts)
      local cfg = require("yaml-companion").setup(opts)
      require("lspconfig")["yamlls"].setup(cfg)
      require("telescope").load_extension("yaml_schema")
    end,
  },
  -- Diagnostics
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          nls.builtins.diagnostics.yamllint,
        })
      end
    end,
  },
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "yamllint",
        "yamlfix",
      },
    },
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function(_, opts)
      require("conform").setup(opts)
      require("conform.formatters.yamlfix").env = {
        -- see https://lyz-code.github.io/yamlfix/#configuration
        YAMLFIX_SEQUENCE_STYLE = "block_style",
        YAMLFIX_WHITELINES = "1",
        YAMLFIX_LINE_LENGTH = "120",
      }
    end,
    opts = {
      formatters_by_ft = {
        yaml = { "yamlfix" },
      },
    },
  },
}

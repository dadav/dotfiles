return {
  -- Install additional tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ansible-language-server",
        "ansible-lint",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.filetype.add({
        filename = {
          ["main.yml"] = "yaml.ansible",
          ["main.yaml"] = "yaml.ansible",
        },
        pattern = {
          [".*/roles/.*.ya?ml$"] = "yaml.ansible",
        },
      })
    end,
    opts = {
      servers = {
        ansiblels = {},
      },
    },
  },
}

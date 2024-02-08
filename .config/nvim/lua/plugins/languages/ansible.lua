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
        pattern = {
          [".*/roles/.*/tasks/.ya?ml$"] = "yaml.ansible",
          [".*/roles/.*/handlers/.ya?ml$"] = "yaml.ansible",
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

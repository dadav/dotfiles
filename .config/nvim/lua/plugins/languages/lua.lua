return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        stylua = {
          prepend_args = {
            "--config-path=" .. vim.env.HOME .. "/.config/stylua.toml",
          },
        },
      },
    },
  },
}

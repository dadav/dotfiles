return {
  -- Show inline diagnostics
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    keys = {
      {
        "<leader>xi",
        function()
          require("lsp_lines").toggle()
        end,
        desc = "Inline diagnostics (lsp_lines)",
      },
    },
    config = function()
      vim.diagnostic.config({ virtual_lines = false })
      require("lsp_lines").setup()
    end,
  },
  -- Disable double line printing
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        update_in_insert = false,
      },
    },
  },
}

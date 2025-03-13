return {
  {
    "sindrets/diffview.nvim",
    opts = function()
      Snacks.toggle({
        name = "Diffview",
        get = function()
          return require("diffview.lib").get_current_view() ~= nil
        end,
        set = function(state)
          vim.cmd("Diffview" .. (state and "Open" or "Close"))
        end,
      }):map("<leader>gdd")
    end,
  },
}

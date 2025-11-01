return {
  "folke/snacks.nvim",
  ---@diagnostic disable-next-line: unused-local
  opts = function(_, opts)
    -- Credit for this section goes to exsesx
    -- https://github.com/LazyVim/LazyVim/discussions/4232#discussioncomment-11191278
    local snacks = require("snacks")
    if pcall(require, "copilot") then
      vim.g.snacks_copilot_enabled = false
      snacks
        .toggle({
          name = "Toggle (Copilot Completion)",
          color = {
            enabled = "azure",
            disabled = "orange",
          },
          get = function()
            return vim.g.snacks_copilot_enabled
          end,
          set = function(state)
            if state then
              vim.g.snacks_copilot_enabled = true
              require("copilot.command").enable()
            else
              vim.g.snacks_copilot_enabled = false
              require("copilot.command").disable()
            end
          end,
        })
        :map("<leader>at")
    end
  end,
}

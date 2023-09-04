local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  return
end

gitsigns.setup({
  current_line_blame = true,
  signcolumn = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "<leader>gn", function()
      if vim.wo.diff then
        return "<leader>gn"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { desc = "[n]ext hunk", noremap = true, expr = true })

    map("n", "<leader>gp", function()
      if vim.wo.diff then
        return "<leader>gp"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { desc = "[p]rev hunk", noremap = true, expr = true })

    -- Actions
    map("n", "<leader>gs", gs.stage_hunk, { desc = "[s]tage hunk" })
    map("n", "<leader>gr", gs.reset_hunk, { desc = "[r]eset hunk" })
    map("v", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "[s]tage hunk" })
    map("v", "<leader>gr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "[r]eset hunk" })

    map("n", "<leader>gS", gs.stage_buffer, { desc = "[S]tage buffer" })
    map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "[u]ndo stage hunk" })
    map("n", "<leader>gR", gs.reset_buffer, { desc = "[R]eset buffer" })
    map("n", "<leader>gP", gs.preview_hunk, { desc = "[P]review hunk" })
    map("n", "<leader>gb", function()
      gs.blame_line({ full = true })
    end, { desc = "[b]lame line" })
    map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "[t]oggle [b]lame" })
    map("n", "<leader>gd", gs.diffthis, { desc = "[d]iff" })
    map("n", "<leader>gD", function()
      gs.diffthis("~")
    end, { desc = "[D]iff" })
    map("n", "<leader>gtd", gs.toggle_deleted, { desc = "[t]oggle [d]eleted" })
  end,
})

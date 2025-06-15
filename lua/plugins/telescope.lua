return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
      local builtin = require"telescope.builtin"

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "[F]ind [F]iles"})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "[F]ind by [G]rep"})
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {desc = "[F]ind [D]iagnostics"})
      vim.keymap.set("n", "<leader>fr", builtin.resume, {desc = "[F]inder [R]esume"})
      vim.keymap.set("n", "<leader>f.", builtin.oldfiles, {desc = '[F]ind Recent Files ("." for repeat)'})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = '[F]ind existing [B]uffers'})
    end,
  } 
}

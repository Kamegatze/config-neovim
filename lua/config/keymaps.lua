-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", {desc = "Toggle [E]xplorer"})

local builtin = require('telescope.builtin')

-- set a vim motion to <Space> + f + f to search for files by their names
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind [F]iles"})
-- set a vim motion to <Space> + f + g to search for files based on the text inside of them
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "[F]ind by [G]rep"})
-- set a vim motion to <Space> + f + d to search for Code Diagnostics in the current project
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
-- set a vim motion to <Space> + f + r to resume the previous search
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]inder [R]esume' })
-- set a vim motion to <Space> + f + . to search for Recent Files
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
-- set a vim motion to <Space> + f + b to search Open Buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })


-- get access to telescopes navigation functions
local actions = require("telescope.actions")

require("telescope").setup({
    -- use ui-select dropdown as our ui
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    -- set keymappings to navigate through items in the telescope io
    mappings = {
        i = {
             -- use <cltr> + n to go to the next option
            ["<C-n>"] = "cycle_history_next",
            -- use <cltr> + p to go to the previous option
            ["<C-p>"] = "cycle_history_prev",
            -- use <cltr> + j to go to the next preview
            ["<C-j>"] = "move_selection_next",
            -- use <cltr> + k to go to the previous preview
            ["<C-k>"] = "move_selection_previous",
        }
    },
    -- load the ui-select extension
    require("telescope").load_extension("ui-select")
})

-- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
-- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
-- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
-- Set vim motion for <Space> + c + r to display references to the code under the cursor
vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
-- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
-- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
-- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

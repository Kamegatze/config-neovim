--Basic
require('core.lazy')
require('core.mappings')

local function describe(x, desc)
    return vim.tbl_extend("force", x, { desc = desc })
end

local function on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set(
        "n",
        "<leader>s",
        vim.lsp.buf.workspace_symbol,
        describe(bufopts, "Show Workspace Symbols")
    )
    vim.keymap.set(
        "n",
        "gD",
        vim.lsp.buf.declaration,
        describe(bufopts, "go to Declarations")
    )
    vim.keymap.set(
        "n",
        "gd",
        vim.lsp.buf.definition,
        describe(bufopts, "go to definitions")
    )
    vim.keymap.set(
        "n",
        "gr",
        vim.lsp.buf.references,
        describe(bufopts, "go to references")
    )
    vim.keymap.set(
        "n",
        "gi",
        vim.lsp.buf.implementation,
        describe(bufopts, "go to implementations")
    )
    vim.keymap.set(
        { "n", "i" },
        "<C-s>",
        vim.lsp.buf.signature_help,
        describe(bufopts, "Help with signature")
    )
    vim.keymap.set(
        "n",
        "<space>wa",
        vim.lsp.buf.add_workspace_folder,
        describe(bufopts, "workspace add folder")
    )
    vim.keymap.set(
        "n",
        "<space>wr",
        vim.lsp.buf.remove_workspace_folder,
        describe(bufopts, "workspace remove folder")
    )
    vim.keymap.set("n", "<space>wl", function()
        vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, describe(bufopts, "workspace list folders"))

    vim.keymap.set(
        "n",
        "<space>rn",
        vim.lsp.buf.rename,
        describe(bufopts, "rename symbol under the cursor")
    )
end


local opts = { noremap = true, silent = true }











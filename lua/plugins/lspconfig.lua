return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = { virtual_text = false },
    servers = {
      bacon_ls = {
        enabled = vim.g.lazyvim_rust_diagnostics == "bacon-ls",
      },
      rust_analyzer = { enabled = vim.g.lazyvim_rust_diagnostics == "rust-analyzer" },
    },
  },
}

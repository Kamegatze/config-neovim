return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { "java-debug-adapter", "java-test", "sonarlint-language-server" })
    end,
  },
}

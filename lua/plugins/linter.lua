return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      java = { "checkstyle" }, -- Enable checkstyle for Java files
    },
    linters = {
      checkstyle = {
        cmd = "checkstyle",
        args = { "-f", "sarif", "-c", vim.fn.getcwd() .. "/config/checkstyle.xml" },
      },
    },
  },
}

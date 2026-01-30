local path_checkstyle_file = vim.fn.getcwd() .. "/config/checkstyle.xml"

return {
  {
    "mfussenegger/nvim-lint",
    enabled = require("config.utils").file_exists(path_checkstyle_file),
    opts = {
      linters_by_ft = {
        java = { "checkstyle" }, -- Enable checkstyle for Java files
      },
      linters = {
        checkstyle = {
          cmd = "checkstyle",
          args = {
            "-f",
            "sarif",
            "-c",
            path_checkstyle_file,
          },
        },
      },
    },
  },
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "nvim-java/nvim-java" },
    config = function()
      require("sonarlint").setup({
        server = {
          cmd = {
            "sonarlint-language-server",
            -- Ensure that sonarlint-language-server uses stdio channel
            "-stdio",
            "-analyzers",
            -- paths to the analyzers you need, using those for python and java in this example
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
          },
        },
        filetypes = {
          -- Tested and working
          "cs",
          "dockerfile",
          "python",
          "cpp",
          "java",
        },
      })
    end,
  },
}

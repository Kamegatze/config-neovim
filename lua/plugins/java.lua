return {
  "nvim-java/nvim-java",
  dependencies = { "folke/which-key.nvim" },
  config = function()
    require("java").setup()
    vim.lsp.config("jdtls", {
      settings = {
        java = {
          format = {
            enabled = true,
            settings = {
              url = "/home/kamegatze/code/formatting/logistic_esb.xml",
              profile = "logistic-esb",
            },
          },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = os.getenv("HOME") .. ".sdkman/candidates/java/21.0.9-zulu",
                default = true,
              },
            },
          },
        },
      },
    })
    vim.lsp.enable("jdtls")
  end,
}

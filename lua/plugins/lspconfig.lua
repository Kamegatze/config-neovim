local path_checkstyle_file = vim.fn.getcwd() .. "/config/checkstyle.xml"
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "nvim-java/nvim-java" },
    opts = {
      -- make sure mason installs the server
      servers = {
        jdtls = {
          settings = {

            java = {
              completion = {
                -- Define the desired import order as a list of strings
                importOrder = { "*" },
              },
              format = {
                enabled = require("config.utils").file_exists(path_checkstyle_file),
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
                  },
                  {
                    name = "JavaSE-17",
                    path = os.getenv("HOME") .. ".sdkman/candidates/java/17.0.17-zulu",
                  },
                  {
                    name = "JavaSE-11",
                    path = os.getenv("HOME") .. ".sdkman/candidates/java/11.0.29-zulu",
                  },
                },
              },
            },
          },
        },
      },
      setup = {
        jdtls = function()
          require("java").setup()
        end,
      },
    },
  },
}

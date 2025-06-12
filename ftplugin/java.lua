local config = {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
  root_dir = vim.fs.dirname(vim.fs.find({"build.gradle.kts", "build.gradle", "setting.gradle.kts", "setting.gradle", ".git", "gradlew", "mvnw"}, {upward = true})[1]),
}

require("jdtls").start_or_attach(config)

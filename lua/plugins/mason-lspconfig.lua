return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local mason_lsp_config = require "mason-lspconfig"
    mason_lsp_config.setup {
      ensure_installed = {
	"jdtls", "lua_ls", "bashls"
      },
      automatic_installation = true,
    }
  end
}

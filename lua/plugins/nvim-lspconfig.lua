return {
  "neovim/nvim-lspconfig",
  config = function()
    local function setup_generic()
      local lspconfig = require "lspconfig"
      local generic_servers = {
         "lua_ls"
      }
      for _, client in ipairs(generic_servers) do
        lspconfig[client].setup {
          on_attach = function(client, bufnr)

	  end,
	}
      end
    end
    setup_generic()
  end
}

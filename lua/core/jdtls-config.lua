vim.api.nvim_create_augroup("NvimJdtlsOnJava", {clear = true})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
 pattern = "*.java",
 callback = function()
   local Path = require "plenary.path"
   local coredor = require "coredor"
   local jdtls = require "jdtls"



 end
})

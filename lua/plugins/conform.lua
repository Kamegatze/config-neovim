local path_checkstyle_file = vim.fn.getcwd() .. "/config/checkstyle.xml"

return {
  "stevearc/conform.nvim",
  enabled = true,
  opts = function()
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = (function()
        if require("config.utils").file_exists(path_checkstyle_file) then
          return {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            json = { "jq" },
            xml = { "xmlformatter" },
          }
        else
          return {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            json = { "jq" },
            xml = { "xmlformatter" },
            java = { "google-java-format" },
          }
        end
      end)(),
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        --
        -- # Example of using shfmt with extra args
        -- shfmt = {
        --   prepend_args = { "-i", "2", "-ci" },
        -- },
        jq = {
          append_args = { "--indent", "2" },
        },
      },
    }
    return opts
  end,
}

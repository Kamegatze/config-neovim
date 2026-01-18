return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		-- when the plugin builds run the TSUpdate command to ensure all our servers are installed and updated
		build = ":TSUpdate",
		config = function()
			-- gain access to the treesitter config functions
			local ts_config = require("nvim-treesitter")

			-- call the treesitter setup function with properties to configure our experience
			ts_config.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			ts_config.install({
				"kotlin",
				"vim",
				"vimdoc",
				"lua",
				"java",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"tsx",
				"markdown",
				"markdown_inline",
				"gitignore",
			})
		end,
	},
}

return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls", "gradle_ls", "kotlin_lsp" },
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test" },
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("gradle_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("kotlin_lsp", {
				capabilities = capabilities,
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("gradle_ls")
			vim.lsp.enable("kotlin_lsp")
		end,
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"AlexandrosAlexiou/kotlin.nvim",
		ft = { "kotlin" },
		dependencies = {
			"mason.nvim",
			"mason-lspconfig.nvim",
			"oil.nvim",
			"trouble.nvim",
		},
		config = function()
            print("kotlin configuration")
			require("kotlin").setup({
				-- Optional: Specify root markers for multi-module projects
				root_markers = {
					"gradlew",
					".git",
					"mvnw",
					"settings.gradle",
                    "settings.gradle.kts"
				},

				-- Optional: Java Runtime to run the kotlin-lsp server itself
				-- NOT REQUIRED when using Mason (kotlin-lsp v261+ includes bundled JRE)
				-- Priority: 1. jre_path, 2. Bundled JRE (Mason), 3. System java
				--
				-- Use this if you want to run kotlin-lsp with a specific Java version
				-- Must point to JAVA_HOME (directory containing bin/java)
				-- Examples:
				--   macOS:   "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
				--   Linux:   "/usr/lib/jvm/java-21-openjdk"
				--   Windows: "C:\\Program Files\\Java\\jdk-21"
				--   Env var: os.getenv("JAVA_HOME") or os.getenv("JDK21")
				jre_path = nil, -- Use bundled JRE (recommended)

				-- Optional: JDK for symbol resolution (analyzing your Kotlin code)
				-- This is the JDK that your project code will be analyzed against
				-- Different from jre_path (which runs the server)
				-- Required for: Analyzing JDK APIs, standard library symbols, platform types
				--
				-- Usually should match your project's target JDK version
				-- Examples:
				--   macOS:   "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
				--   Linux:   "/usr/lib/jvm/java-17-openjdk"
				--   Windows: "C:\\Program Files\\Java\\jdk-17"
				--   SDKMAN:  os.getenv("HOME") .. "/.sdkman/candidates/java/17.0.8-tem"
				jdk_for_symbol_resolution = nil, -- Auto-detect from project

				-- Optional: Specify additional JVM arguments for the kotlin-lsp server
				jvm_args = {
					"-Xmx4g", -- Increase max heap (useful for large projects)
				},

				-- Optional: Configure inlay hints (requires kotlin-lsp v261+)
				-- All settings default to true, set to false to disable specific hints
				inlay_hints = {
					enabled = true, -- Enable inlay hints (auto-enable on LSP attach)
					parameters = true, -- Show parameter names
					parameters_compiled = true, -- Show compiled parameter names
					parameters_excluded = false, -- Show excluded parameter names
					types_property = true, -- Show property types
					types_variable = true, -- Show local variable types
					function_return = true, -- Show function return types
					function_parameter = true, -- Show function parameter types
					lambda_return = true, -- Show lambda return types
					lambda_receivers_parameters = true, -- Show lambda receivers/parameters
					value_ranges = true, -- Show value ranges
					kotlin_time = true, -- Show kotlin.time warnings
				},
			})
		end,
	},
}

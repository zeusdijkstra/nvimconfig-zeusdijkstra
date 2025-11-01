return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				python = { "black" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				-- Use LSP formatting if available; fallback to Conform
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
	},
}

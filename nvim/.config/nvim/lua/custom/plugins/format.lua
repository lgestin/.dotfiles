return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "n",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "ruff_format" },
		},
	},
}

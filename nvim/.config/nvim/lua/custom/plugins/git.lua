vim.keymap.set("n", "<leader>g", "<Cmd>Neogit<CR>", { desc = "git status" })
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
}

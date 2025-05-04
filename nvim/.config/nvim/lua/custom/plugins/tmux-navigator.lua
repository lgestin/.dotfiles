vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "window right" })
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "window up" })
return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
}

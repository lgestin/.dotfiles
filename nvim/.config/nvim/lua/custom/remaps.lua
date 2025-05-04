-- Split panes
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "split horizontally" })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "split vertically" })
-- File Explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "file explorer" })

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
vim.keymap.set("n", "<leader>t", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)
vim.keymap.set("t", "<Esc>", "<cmd>TermClose<CR>")

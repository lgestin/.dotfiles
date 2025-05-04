return {
	"mbbill/undotree",
	config = function()
		-- Undotree
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}

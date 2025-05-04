return {
	"Shatur/neovim-ayu",
	name = "ayu",
	config = function()
	    require("ayu").setup({
		mirage = false,
	    })
	    vim.cmd("colorscheme ayu")
	end,
}


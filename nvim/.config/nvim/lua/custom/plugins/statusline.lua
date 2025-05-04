return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "ayu_dark",
				-- component_separators = { left = "", right = "" },
				component_separators = { left = "\u{e0b9}", right = "\u{e0b9}" },
				-- section_separators = { left = "", right = "" },
				section_separators = { left = "\u{E0B8} ", right = "\u{E0BE} " },

				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" }, -- "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
-- return {
-- 	"echasnovski/mini.statusline",
-- 	version = false,
-- 	config = function()
-- 		require("mini.statusline").setup({
-- 			-- Custom content for the statusline
-- 			content = {
-- 				-- Customize the active and inactive statusline
-- 				active = function()
-- 					local statusline = require("mini.statusline")
-- 					local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
-- 					local git = statusline.section_git({ trunc_width = 75 })
-- 					local diagnostics = "" -- Remove diagnostics/warning section
-- 					local filename = statusline.section_filename({ trunc_width = 140 })
-- 					-- local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
-- 					local fileinfo = ""
-- 					-- local location = statusline.section_location({ trunc_width = 75 })
-- 					local location = ""
--
-- 					return statusline.combine_groups({
-- 						{ hl = mode_hl, strings = { mode } },
-- 						{ hl = "statuslineFilename", strings = { filename } },
-- 						"%<", -- Mark general truncate point
-- 						-- { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
-- 						{},
-- 						"%=", -- End left alignment, start right alignment
-- 						{ strings = { git } },
-- 						-- { hl = "statuslineFileinfo", strings = { fileinfo } },
-- 						fileinfo,
-- 						diagnostics, -- This is now an empty string
-- 						location,
-- 						-- { hl = "statuslineLocation", strings = { location } },
-- 					})
-- 				end,
-- 			},
--
-- 			-- Optional: Set custom highlights if needed
-- 			set_highlights = true,
-- 		})
-- 	end,
-- }

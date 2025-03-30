return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {
			surrounds = {
				["("] = false,
				["["] = false,
				["<"] = false,
			},
			aliases = {
				["("] = ")",
				["["] = "]",
				["<"] = ">",
			},
			keymaps = {
				insert = false,
				insert_line = false,
				normal = "s",
				normal_cur = "ss",
				normal_line = false,
				normal_cur_line = "S",
				visual = "s",
				visual_line = "S",
				delete = "ds",
				change = "cs",
				change_line = false,
			},
		},
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({
				cloak_length = 5,
				try_all_patterns = true,
				cloak_telescope = true,
				cloak_on_leave = false,
				patterns = {
					{
						file_pattern = { ".env*", "credentials" },
						cloak_pattern = "=.+",
						replace = nil,
					},
				},
			})
		end,
	},
}

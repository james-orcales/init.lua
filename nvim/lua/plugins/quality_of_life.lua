return {
	{
		"kylechui/nvim-surround",
                version = "^3.0.0",
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
				normal = "s",
				normal_cur = "ss",
				normal_cur_line = "S",
				visual = "s",
				visual_line = "S",
				delete = "ds",
				change = "cs",
				insert = false,
				insert_line = false,
				normal_line = false,
				change_line = false,
			},
		},
	},
	{
                url = "https://www.github.com/junegunn/vim-easy-align",
                commit = "9815a55dbcd817784458df7a18acacc6f82b1241",
                pin = true,
		config = function()
			vim.g.easy_align_ignore_groups = {}
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
		end,
	},
}

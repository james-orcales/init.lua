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
		"jake-stewart/multicursor.nvim",
		branch = "1.0",
		config = function()
			local mc = require("multicursor-nvim")
			mc.setup()
			local set = vim.keymap.set
			set({ "n", "x" }, "b", mc.toggleCursor)
			-- Mappings defined in a keymap layer only apply when there are
			-- multiple cursors. This lets you have overlapping mappings.
			mc.addKeymapLayer(function(layerSet)
				-- Select a different cursor as the main one.
				layerSet({ "n", "x" }, "<a-left>", mc.prevCursor)
				layerSet({ "n", "x" }, "<a-right>", mc.nextCursor)

				layerSet("n", "<c-c>", function()
					if not mc.cursorsEnabled() then
						mc.enableCursors()
					else
						mc.clearCursors()
					end
				end)
			end)
		end,
	},
	{
		"junegunn/vim-easy-align",
		config = function()
			vim.g.easy_align_ignore_groups = {}
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
		end,
	},
}

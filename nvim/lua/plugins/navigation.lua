return {
	{
		"ibhagwan/fzf-lua",
		event = "VimEnter",
		config = function()
			local fzf = require("fzf-lua")
			vim.keymap.set("n", "<Space>", function()
				fzf.files({ cwd_prompt = false, previewer = false })
			end)
			vim.keymap.set("n", "<C-Space>", fzf.builtin)
			vim.keymap.set("n", "s<Space>", fzf.live_grep_native)
			vim.keymap.set("n", "h<Space>", function()
				fzf.help_tags({ previewer = false })
			end)
			vim.keymap.set("n", "m<Space>", function()
				fzf.manpages({ previewer = false })
			end)
			vim.keymap.set("n", "c<Space>", fzf.lsp_document_symbols)
			vim.keymap.set("n", "q<Space>", fzf.quickfix)
			fzf.setup({
				defaults = { header = false },
				winopts = {
					backdrop = 100,
					fullscreen = true,
				},
				lsp = { symbols = { symbol_style = 3 } },
				hls = {
					normal = "NormalFloat",
					border = "FloatBorder",
				},
				keymap = {
					builtin = {
						["<Right>"] = "preview-down",
						["<Left>"] = "preview-up",
					},
					fzf = {
						["ctrl-h"] = "backward-kill-word",
						["shift-down"] = "half-page-down",
						["shift-up"] = "half-page-up",
						["home"] = "first",
						["end"] = "last",
					},
				},
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			local leap = require("leap")

			leap.opts.safe_labels = {}
			leap.opts.labels = "setnricaoplfuwydbkghqj"
			leap.opts.max_phase_one_targets = 0
			leap.opts.special_keys.next_group = "<space>"

			vim.keymap.set({ "n", "x", "o" }, "t", "<Plug>(leap)")
			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
		end,
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
}

return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					-- Change the default chat adapter
					chat = {
						adapter = "gemini",
						keymaps = {
							close = { modes = { n = "<C-Q>", i = "<C-Q>" } },
						},
					},
					inline = {
						adapter = "gemini",
					},
				},
				-- Set debug logging
				log_level = "DEBUG",
			})

			-- Set keymap within the config function
			vim.keymap.set("n", "<leader>c", ":CodeCompanionChat Toggle<CR>", { desc = "Toggle CodeCompanion window" })
		end,
	},
}

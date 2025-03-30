vim.keymap.set("n", "le", 'ccslog.Error("", "msg", err)<ESC>^ci"', { noremap = true, silent = true })
vim.keymap.set("n", "li", 'ccslog.Info("")<ESC><LEFT>i', { noremap = true, silent = true })

local fzf = require("fzf-lua")
vim.keymap.set("n", "sl", function()
	fzf.files({
		winopts = { split = "aboveleft new" },
		actions = {
			["enter"] = function(selected, opts)
				if selected ~= nil then
					fzf.actions.file_split(selected, opts)
					fzf.lsp_document_symbols()
				end
			end,
		},
		cwd_prompt = false,
		previewer = false,
		cwd = "/usr/local/go/src/",
	})
end, { desc = "Fuzzy Find Standard Library Files" })

vim.keymap.set("n", "SL", function()
	fzf.live_grep_native({
		winopts = { split = "aboveleft new" },
		actions = {
			["enter"] = function(selected, opts)
				if selected ~= nil then
					fzf.actions.file_split(selected, opts)
				end
			end,
		},
		cwd_prompt = false,
		cwd = "/usr/local/go/src/",
	})
end, { desc = "Fuzzy Find Standard Library Files" })

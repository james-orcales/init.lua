local override = function(modes, new, default, desc, custom_behavior)
	local behavior = default
	if custom_behavior then
		behavior = custom_behavior
	end

	vim.keymap.set(modes, default, "<nop>")
	vim.keymap.set(modes, new, behavior, { desc = desc })
end

-------- IMPROVED FUNCTIONALITY --------

vim.keymap.set("n", "q:", ":q", { desc = "use q? instead" })

vim.keymap.set("n", "H", "<nop>")

-- Center screen on search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Center screen on jump
override({ "n", "v" }, "<S-Down>", "<C-D>", "Page down, center cursor", "<C-D>zz")
override({ "n", "v" }, "<S-Up>", "<C-U>", "Page up, center cursor", "<C-U>zz")
override({ "n", "v" }, "<C-S-Down>", "<C-D>", "Page down multiple, center cursor", "<C-D><C-D><C-D>zz")
override({ "n", "v" }, "<C-S-Up>", "<C-U>", "Page up multiple, center cursor", "<C-U><C-U><C-U>zz")

override({ "n" }, "f", "<C-^>", "Alternate File")

-- Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Remap comment
vim.keymap.set("n", "cm", "gcc", { remap = true })
vim.keymap.set("v", "cm", "gc", { remap = true })

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-------- NEW FUNCTIONALITY --------

-- Move selection in visual mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")

-- Delete without affecting default register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Case-insensitive search and replace without confirmation
vim.keymap.set("n", "sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Extend gs to 100ms
vim.keymap.set("n", "gs", "<cmd>sleep 100m<CR>")

---- Yank ----
-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank whole line including newline to system clipboard
vim.keymap.set("n", "<leader>yy", [["+yy]])

-- Open File Explorer
vim.keymap.set("n", "-", vim.cmd.Ex)

-- Add character to end of line
vim.keymap.set("n", ";", "mzA;<ESC>`z")
vim.keymap.set("n", ",", "mzA,<ESC>`z")

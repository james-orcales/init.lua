-- Emulate keybinds of graphical applications.

local override = function(modes, new, default, desc, custom_behavior)
    local behavior = default
    if custom_behavior then
        behavior = custom_behavior
    end

    vim.keymap.set(modes, default, "<nop>")
    vim.keymap.set(modes, new, behavior, { desc = desc })
end

override({ "n", "v", "o" }, "<C-Y>", "<C-R>", "Redo")
vim.keymap.set("n", "<C-S>", "<CMD>w<CR>", { desc = "Save File" })
vim.keymap.set("i", "<C-S>", "<ESC><CMD>w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<C-Q>", "<CMD>q<CR>", { desc = "Quit Pane" })
vim.keymap.set("n", "<C-S-Q>", "<CMD>qa!<CR>", { desc = "Force Quit Vim" })

override({ "n", "v", "o" }, "<C-Left>", "b", "Jump previous word")
override({ "n", "v", "o" }, "<S-Left>", "B", "Jump previous whitespace")
override({ "n", "v", "o" }, "<C-Right>", "w", "Jump next word")
override({ "n", "v", "o" }, "<S-Right>", "W", "Jump next whitespace")

override({ "n", "v", "o" }, "<C-Home>", "gg", "Jump first line")
override({ "n", "v", "o" }, "<C-End>", "G", "Jump last line")
vim.keymap.set({ "n", "v", "o" }, "<Home>", "^", { desc = "Jump to first char of current line" })
vim.keymap.set({ "i" }, "<Home>", "<C-o>^", { desc = "Jump to first char of current line" })

override({ "i", "c" }, "<C-H>", "<C-W>", "Kill word before cursor")
vim.keymap.set({ "n" }, "<C-H>", "db", { desc = "Kill word before cursor" })
vim.keymap.set({ "n" }, "<C-BS>", "db", { desc = "Kill word before cursor" })
override({ "i", "c" }, "<C-BS>", "<C-W>", "Kill word before cursor")
vim.keymap.set({ "i" }, "<C-Del>", "<Esc><Right>dwi", { desc = "Kill next word from cursor" })
vim.keymap.set({ "n" }, "<C-Del>", "dw", { desc = "Kill next word from cursor" })
vim.keymap.set({ "n" }, "<S-Del>", "dW", { desc = "Kill to whitespace from cursor" })

override("n", "<BS>", "x", "Kill char before cursor", "<Left>x")
override("v", "<BS>", "x", "Remap x to Backspace")

-- keymap.del() doesn't work on default keybinds

vim.g.colejak = 1

-------- IMPROVING FUNCTIONALITY --------

local override = function(modes, default, new, custom_behavior)
    local behavior = default
    if custom_behavior then
        behavior = custom_behavior
    end
    vim.keymap.set(modes, default, "<nop>")
    vim.keymap.set(modes, new, behavior, { noremap = true })
end


override({ "n", "v", "o" }, "b", "<C-Left>")
override({ "n", "v", "o" }, "B", "<S-Left>")
override({ "n", "v", "o" }, "w", "<C-Right>")
override({ "n", "v", "o" }, "W", "<S-Right>")


override({ "n", "v" }, "<C-D>", "<S-Down>", "<C-D>zz")
override({ "n", "v" }, "<C-U>", "<S-Up>", "<C-U>zz")


vim.keymap.set({ "n", "v", "o" }, "<Home>", "^", { noremap = true })
vim.keymap.set({ "i" }, "<Home>", "<C-o>^", { noremap = true })
override({ "n", "v", "o" }, "gg", "<C-Home>")
override({ "n", "v", "o" }, "G", "<C-End>")

override({ "i", "c" }, "<C-W>", "<C-H>")
override({ "i", "c" }, "<C-W>", "<C-BS>")


override("n", "x", "<BS>", "<Left>x")
override("v", "x", "<BS>")


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


-------- NEW FUNCTIONALITY --------

vim.keymap.set({ "n" }, "<C-H>", "db")
vim.keymap.set({ "n" }, "<C-BS>", "db")

vim.keymap.set({ "n" }, "<C-Del>", "dw")
vim.keymap.set({ "n" }, "<S-Del>", "dW")
vim.keymap.set({ "i" }, "<C-Del>", "<Esc><Right>dwi")

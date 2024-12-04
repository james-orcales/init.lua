vim.keymap.set("n", "le", 'ccslog.Error("", "msg", err)<ESC>^ci"', { noremap = true, silent = true })
vim.keymap.set("n", "li", 'ccslog.Info("")<ESC><LEFT>i', { noremap = true, silent = true })

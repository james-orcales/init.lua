-------- IMPROVED FUNCTIONALITY --------

-- Center screen on search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move decrement because <C-X> is unergonomic
vim.keymap.set("n", "<C-Q>", "<C-X>", { noremap = true })

-- Join current line with next and keep curson in place
vim.keymap.set("n", "<S-CR>", "mzJ`z")

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "y$")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")


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



---- Carriage Return  ----
-- Place cursor up to end on new line
vim.keymap.set("n", "<CR>", "i<CR><ESC>_")
-- Place whole line on new line
vim.keymap.set("n", "<C-CR>", "mx<S-O><ESC>`x")
-- Sandwich selection on newline
vim.keymap.set("v", "<CR>", "<ESC>`>a<CR><ESC>`<i<CR><ESC>")



---- Yank ----
-- Yank whole line except for newline
vim.keymap.set("n", "<C-Y>", "mx^y$`x")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank whole line including newline to system clipboard
vim.keymap.set("n", "<leader>yy", [["+yy]])

-- Yank whole line to system except newline to system clipboard
vim.keymap.set("n", "<leader><C-Y>", [[mx_"+y$`x]])

-- Yank cursor to end of line excluding newline to system clipboard
vim.keymap.set("n", "<leader>Y", [["+y$]])



-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]])


-- Clear current line and retain newline
vim.keymap.set("n", "cl", "cc<ESC>")

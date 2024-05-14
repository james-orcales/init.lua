vim.keymap.set("n", "<leader>en", "oif err != nil {<return>}<esc>O", { noremap = true, silent = true })

vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "gs", "<cmd>sleep 100m<CR>")

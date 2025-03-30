vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     desc = "LSP Format on save",
--     group = vim.api.nvim_create_augroup("format-write", { clear = true }),
--     callback = function()
--         vim.lsp.buf.format()
--     end
-- })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    desc = "Spacing Format on save",
    group = vim.api.nvim_create_augroup("spacing-format-write", { clear = true }),
    pattern = { "*.odin", "*.gago"},
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        -- https://vim.fandom.com/wiki/Regex_lookahead_and_lookbehind
        vim.cmd([[:%s/^\s*\n\{1,}/\r\r]])
        vim.api.nvim_win_set_cursor(0, pos)
    end
})

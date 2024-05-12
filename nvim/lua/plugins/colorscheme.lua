return {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    priority = 1000,
    config = function()
        local dracula = require("dracula")
        dracula.setup({
            show_end_of_buffer = false,
            transparent_bg = true,
            italic_comment = true,
            colors = {
                bg = "#000000",
                black = "#000000",
                menu = "#000000",
            }
        })
        vim.cmd.colorscheme("dracula-soft")
        vim.g.colorpalette = dracula.colors()
    end
}

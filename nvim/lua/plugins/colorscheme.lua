vim.api.nvim_set_hl(0, "CustomViolet", { fg = '#8F56C8' })
vim.api.nvim_set_hl(0, "CustomBlue", { fg = '#A4BFEB' })

local blue = {
    zero = "#030307",
    one = "#07060F",
    two = "#0E0C1D",
    three = "#15122B",
    four = "#1C183A",
    five = "#2A2456",
}

local bg = blue.one
local bg_darker = blue.zero
local comment = "#6e6a86"

return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            bold = false,
            italic = { comments = false, strings = false, },
            palette_overrides = {
                dark0 = bg,
                dark1 = blue.two,
                dark2 = blue.three,
                dark3 = blue.four,
                dark4 = comment,
            },
            overrides = {
                Comment = { fg = comment },
                String = { link = "GruvboxAqua" },
                SignColumn = { link = "Ignore" },
                StatusLine = { fg = blue.three },
                ColorColumn = { bg = blue.five },
                FloatBorder = { bg = bg_darker },
                FloatTitle = { bg = bg_darker },
                FloatFooter = { bg = bg_darker },
                NormalFloat = { bg = bg_darker },

                Exception = { link = "CustomViolet" },
                ["@keyword.import"] = { link = "CustomViolet" },
                ["@keyword.defer"] = { link = "CustomBlue" },
            },
        })
        vim.cmd("colorscheme gruvbox")
    end
}

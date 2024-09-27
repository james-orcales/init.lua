return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            surrounds = {
                ["("] = false,
                ["["] = false,
                ["<"] = false,
            },
            aliases = {
                ["("] = ")",
                ["["] = "]",
                ["<"] = ">",
            },
            keymaps = {
                insert = false,
                insert_line = false,
                normal = "s",
                normal_cur = "ss",
                normal_line = false,
                normal_cur_line = "S",
                visual = "s",
                visual_line = "S",
                delete = "ds",
                change = "cs",
                change_line = "cS",
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require "nvim-autopairs".setup()
        end
    },
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        config = function()
            local nnp = require("no-neck-pain")
            nnp.setup({
                width = 90,
                minSideBufferWidth = 0,
                autocmds = {
                    enableOnVimEnter = true,
                    skipEnteringNoNeckPainBuffer = true,
                },
                buffers = {
                    left = {},
                    right = { enabled = false, },
                },
            })
        end
    },
}

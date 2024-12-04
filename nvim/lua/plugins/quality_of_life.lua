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
}

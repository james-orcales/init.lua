return {
    { "folke/neodev.nvim" },
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        opts = {}
    },
    { "hrsh7th/nvim-cmp", event = { "InsertEnter", "CmdlineEnter" }, },
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    normal_hl = "Normal",
                    winblend = 0,
                    border = "rounded",
                    zindex = 45,
                    max_width = 0,
                    max_height = 0,
                    x_padding = 200,
                    y_padding = 0,
                    align = "top",
                    relative = "editor",
                },
            },
        },
    },
    'hrsh7th/cmp-nvim-lsp',
}

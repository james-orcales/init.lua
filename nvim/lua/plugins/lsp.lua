return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
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
                    normal_hl = "NormalFloat",
                    winblend = 10,
                    border = "rounded",
                    zindex = 45,
                    max_width = 0,
                    max_height = 0,
                    x_padding = 0,
                    y_padding = 0,
                    align = "top",
                    relative = "editor",
                },
            },
        },
    },
    'hrsh7th/cmp-nvim-lsp',
}

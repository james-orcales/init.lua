return {
    {
        'numToStr/Comment.nvim',
        opts = {
            toggler = { line = "<leader>cm", block = nil },
            opleader = { line = "<leader>cm", block = nil },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {
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
        opts = {},
    },
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        config = function()
            require("no-neck-pain").setup({
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
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_echo_preview_url = 1
        end,
        ft = { "markdown" },
        keys = {
            { "<leader>md", "<cmd>MarkdownPreviewToggle<CR>" }
        }
    },
}

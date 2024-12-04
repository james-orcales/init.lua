return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VimEnter",
        config = function()
            local fzf = require "fzf-lua"
            vim.keymap.set("n", "<Space>", function() 
                fzf.files({ cwd_prompt = false, previewer = false, }) 
            end)
            vim.keymap.set("n", "<C-Space>", fzf.builtin)
            vim.keymap.set("n", "b", fzf.buffers)
            vim.keymap.set("n", "s<Space>", fzf.live_grep_native)
            vim.keymap.set("n", "h<Space>", function() fzf.help_tags({previewer = false}) end)
            vim.keymap.set("n", "m<Space>", function() fzf.manpages({previewer = false}) end)
            vim.keymap.set("n", "c<Space>", fzf.lsp_document_symbols)
            vim.keymap.set("n", "q<Space>", fzf.quickfix)
            fzf.setup {
                defaults = { header = false, },
                winopts = {
                    backdrop = 100,
                    fullscreen = true,
                },
                lsp = { symbols = { symbol_style = 3 } },
                hls = {
                    normal = "NormalFloat",
                    border = "FloatBorder",
                },
                keymap = {
                    builtin = {
                        ["<Right>"] = "preview-down",
                        ["<Left>"] = "preview-up"
                    },
                    fzf = {
                        ["ctrl-h"] = "backward-kill-word",
                        ["shift-down"] = "half-page-down",
                        ["shift-up"] = "half-page-up",
                        ["home"] = "first",
                        ["end"] = "last",
                    }
                }
            }
        end
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        config = function()
            local leap = require("leap")

            leap.opts.safe_labels = {}
            leap.opts.labels = "setnricaoplfuwydbkghqj"
            leap.opts.max_phase_one_targets = 0
            leap.opts.special_keys.next_group = '<space>'

            vim.keymap.set({ 'n', 'x', 'o' }, 't', '<Plug>(leap)')
            vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
        end
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
        },
        keys = {
            { "<M-Left>",  "<ESC><cmd>TmuxNavigateLeft<cr>",  mode = { "n", "i" } },
            { "<M-Down>",  "<ESC><cmd>TmuxNavigateDown<cr>",  mode = { "n", "i" } },
            { "<M-Up>",    "<ESC><cmd>TmuxNavigateUp<cr>",    mode = { "n", "i" } },
            { "<M-Right>", "<ESC><cmd>TmuxNavigateRight<cr>", mode = { "n", "i" } },
        },
    },
}

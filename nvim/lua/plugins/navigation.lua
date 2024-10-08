return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VimEnter",
        config = function()
            local fzf = require "fzf-lua"
            vim.keymap.set("n", "<Space>", function() fzf.files({ cwd_prompt = false, }) end)
            vim.keymap.set("n", "<C-Space>", fzf.builtin)
            vim.keymap.set("n", "s<Space>", function()
                fzf.live_grep_native({ winopts = { preview = { hidden = "nohidden" } } })
            end)
            vim.keymap.set("n", "h<Space>", fzf.help_tags)
            vim.keymap.set("n", "m<Space>", fzf.manpages)
            vim.keymap.set("n", "c<Space>", function()
                fzf.lsp_document_symbols({ winopts = { preview = { hidden = "nohidden" } } })
            end)

            fzf.setup {
                defaults = { header = false, },
                winopts = {
                    backdrop = 100,
                    fullscreen = true,
                    preview = { hidden = "hidden", },
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
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({ settings = { save_on_toggle = true, sync_on_ui_close = true } })

            vim.keymap.set("n", "<leader>hp", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "f", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "F", function() harpoon:list():replace_at(1) end)

            vim.keymap.set("n", "b", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "B", function() harpoon:list():replace_at(2) end)

            vim.keymap.set("n", "w", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "W", function() harpoon:list():replace_at(3) end)

            vim.keymap.set("n", "l", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "L", function() harpoon:list():replace_at(4) end)
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
            vim.api.nvim_set_hl(0, "LeapLabelPrimary", { bg = "#FDFD96", fg = "#000000" })
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

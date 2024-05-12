return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require "telescope".setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-H>"] = function()
                                vim.api.nvim_input "<C-W>"
                            end,
                            ["<C-BS>"] = function()
                                vim.api.nvim_input "<C-W>"
                            end,
                        },
                    },
                }
            }
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', "w", builtin.find_files, {})
            vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>ts', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
        end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true
                }
            })

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>hp", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<A-n>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-e>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-i>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-o>", function() harpoon:list():select(4) end)
        end
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        config = function()
            local leap = require("leap")
            local palette = vim.g.colorpalette

            leap.opts.safe_labels = {}
            leap.opts.labels = "arstgoienhqwdpyul"
            leap.opts.max_phase_one_targets = 0
            leap.opts.special_keys.next_group = '<backspace>'

            vim.keymap.set({ 'n', 'x', 'o' }, 't', '<Plug>(leap)')
            vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = palette["comment"] })
            vim.api.nvim_set_hl(0, "LeapLabelPrimary", { bg = palette["yellow"], fg = palette["black"] })
            vim.api.nvim_set_hl(0, "LeapLabelSecondary", { bg = palette["cyan"], fg = palette["black"] })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "netrw",
                desc = "remap T in NetRw",
                group = vim.api.nvim_create_augroup("netrw-t", { clear = true }),
                callback = function()
                    vim.keymap.set("n", 't', '<Plug>(leap)', { remap = true, buffer = true })
                end
            })
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
            { "<M-Left>",  "<cmd>TmuxNavigateLeft<cr>" },
            { "<M-Down>",  "<cmd>TmuxNavigateDown<cr>" },
            { "<M-Up>",    "<cmd>TmuxNavigateUp<cr>" },
            { "<M-Right>", "<cmd>TmuxNavigateRight<cr>" },
        },
    },
}

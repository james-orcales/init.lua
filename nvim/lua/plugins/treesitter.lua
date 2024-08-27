return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function() require("nvim-treesitter.install").update({ with_sync = true })() end,
        config = function()
            require('nvim-treesitter.configs').setup({
                ignore_install = {},
                modules = {},
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "html",
                    "toml",
                    "go",
                    "python",
                    "zig",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require 'treesitter-context'.setup {
                max_lines = 1,           -- How many lines the window should span. Values <= 0 mean no limit.
                multiline_threshold = 1, -- Maximum number of lines to show for a single context
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = '-',
                zindex = 20,     -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    }
}

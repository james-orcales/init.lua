return {
    "nvim-treesitter/nvim-treesitter",
    build = function() require("nvim-treesitter.install").update({ with_sync = true })() end,
    config = function()
        require('nvim-treesitter.configs').setup({
            ignore_install = {},
            modules = {},
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "go", "bash", "javascript", "typescript", "python" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}

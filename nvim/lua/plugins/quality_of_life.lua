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
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldcolumn = '0' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            vim.cmd("hi Folded guibg=NONE")

            -- https://github.com/kevinhwang91/nvim-ufo/issues/115#issuecomment-1436059023
            vim.cmd [[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]]

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
            local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
            for _, ls in ipairs(language_servers) do
                require('lspconfig')[ls].setup({
                    capabilities = capabilities
                    -- you can add other fields for setting up lsp server in this table
                })
            end

            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end

            require('ufo').setup({
                fold_virt_text_handler = handler,
                open_fold_hl_timeout = 150,
            })
            vim.keymap.set('n', 'zF', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zf', require('ufo').closeAllFolds)
            vim.keymap.set('n', 'zk', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end)
        end
    },
}

local palette = {
    ["blue"] = "#A3CAE9",
    ["green"] = "#6E9362",

    ["text_dark"] = "#555555",
    ["background"] = "#000000",
    ["foreground"] = "#DDDDDD",
}
vim.cmd.colorscheme("quiet")

vim.api.nvim_set_hl(0, "Directory", { fg = palette["blue"] })

vim.api.nvim_set_hl(0, "Keyword", { fg = palette["text_dark"] })
vim.api.nvim_set_hl(0, "@keyword.type", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.repeat", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.conditional", { link = "Keyword" })

vim.api.nvim_set_hl(0, "Delimiter", { fg = palette["text_dark"] })
vim.api.nvim_set_hl(0, "Operator", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "MatchParen", { link = "Delimiter" })

vim.api.nvim_set_hl(0, "Comment", { fg = palette["text_dark"] })

vim.api.nvim_set_hl(0, "String", { fg = palette["green"] })
vim.api.nvim_set_hl(0, "Character", { link = "String"})
vim.api.nvim_set_hl(0, "@string.escape", { link = "String" })

vim.api.nvim_set_hl(0, "Visual", { bg = "#333333", })
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Visual" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0A0A0A" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "Exception", { fg = palette["text_dark"] })

vim.api.nvim_set_hl(0, "@lsp.type.namespace", { link = "Ignore" })

-- Only show line number for treesitter context
vim.api.nvim_set_hl(0, "LineNr", { fg = "#0a0a0a", bg = "#0a0a0a"} )
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = palette["background"] } )
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = palette["foreground"] } )

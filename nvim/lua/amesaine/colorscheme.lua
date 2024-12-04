local palette = {
    ["yellow"] = "#DB9D47",
    ["blue"] = "#5B5E86",
    ["green"] = "#6E9362",
    ["red"] = "#A24040",

    ["text_dark"] = "#555555",
    ["text_mid"] = "#AAAAAA",
    ["text_light"] = "#FFFFFF",
}
vim.cmd.colorscheme("quiet")

vim.api.nvim_set_hl(0, "Keyword", { fg = palette["text_dark"] })
vim.api.nvim_set_hl(0, "@keyword.type", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.repeat", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.conditional", { link = "Keyword" })

vim.api.nvim_set_hl(0, "Delimiter", { fg = palette["text_dark"] })
vim.api.nvim_set_hl(0, "Operator", { fg = palette["text_dark"] })
vim.api.nvim_set_hl(0, "Comment", { fg = palette["text_dark"] })
vim.api.nvim_set_hl(0, "String", { fg = palette["green"] })
vim.api.nvim_set_hl(0, "@string.escape", { link = "String" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#333333", })
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Visual" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0A0A0A" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "Exception", { fg = palette["text_dark"] })

vim.api.nvim_set_hl(0, "@lsp.type.namespace", { link = "Ignore" })

vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#222222" } )

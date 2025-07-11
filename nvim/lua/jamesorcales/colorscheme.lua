local palette = {
    ["yellow"]     = "#F6C177",
    ["green"]      = "#31748F",
    ["text_dark"]  = "#777777",
    ["text_mid"]   = "#AAAAAA",
    ["text_light"] = "#FFFFFF",
}
vim.cmd.colorscheme("quiet")


vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd [[syntax match Punctuation /[{}\[\]\(\)\.,]/]]
  end,
})


vim.api.nvim_set_hl(0, "Punctuation",                { fg   = palette["text_dark"] })
vim.api.nvim_set_hl(0, "@punctuation.bracket.lua",   { link = "Punctuation"        })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.lua", { link = "Punctuation"        })
vim.api.nvim_set_hl(0, "@constructor.lua",           { link = "Punctuation"        })
vim.api.nvim_set_hl(0, "Keyword",                    { fg   = palette["green"]     })
vim.api.nvim_set_hl(0, "@keyword",                   { link = "Keyword"            })
vim.api.nvim_set_hl(0, "@keyword.conditional.lua",   { link = "Keyword"            })
vim.api.nvim_set_hl(0, "@keyword.repeat.lua",        { link = "Keyword"            })
vim.api.nvim_set_hl(0, "Comment",                    { fg   = palette["text_dark"] })
vim.api.nvim_set_hl(0, "String",                     { fg   = palette["yellow"]    })
vim.api.nvim_set_hl(0, "Directory",                  { fg   = palette["yellow"]    })
vim.api.nvim_set_hl(0, "Visual",                     { bg   = "#333333",           })
vim.api.nvim_set_hl(0, "NormalFloat",                { bg   = "#0A0A0A"            })
vim.api.nvim_set_hl(0, "StatusLine",                 { bg   = "#111111"            })
vim.api.nvim_set_hl(0, "TODO",                       { link = "None"               })
-- gray out brackets. modify treesitter highlighting since lua treesitter is bundled with nvim already

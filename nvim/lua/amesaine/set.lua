vim.opt.laststatus = 3
vim.opt.statusline = [[%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P]]

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.rnu = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 1

vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 500

vim.opt.colorcolumn = "100"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.fillchars = { eob = " " }

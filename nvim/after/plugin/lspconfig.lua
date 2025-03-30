require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "gopls", "ols" },
})

local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.gopls.setup({
	capabilities = capabilities,
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			analyses = {
				unusedvariable = true,
			},
		},
	},
	init_options = {
		experimentalPostfixCompletions = false,
	},
})

vim.g.zig_fmt_autosave = false
nvim_lsp.zls.setup({
	capabilities = capabilities,
	cmd = { "/home/amesaine/build/zls/zig-out/bin/zls" },
	settings = {
		enable_autofix = false,
		completion_label_details = false, -- https://github.com/zigtools/zls/pull/1696
		-- enable_build_on_save = true,      -- https://kristoff.it/blog/improving-your-zls-experience/
		enable_argument_placeholders = false,
		enable_snippets = true,
	},
})

nvim_lsp.clangd.setup({
	capabilities = capabilities,
})

nvim_lsp.jedi_language_server.setup({
	capabilities = capabilities,
})

nvim_lsp.ols.setup({
	capabilities = capabilities,
	init_options = {
		checker_args = "-strict-style -vet -vet-cast -disallow-do",
	},
})

nvim_lsp.ts_ls.setup({
	capabilities = capabilities,
})

vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local fzf = require("fzf-lua")

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set({ "n", "i" }, "<C-K>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		vim.keymap.set({ "n", "v" }, "ca<Space>", function()
			fzf.lsp_code_actions({})
		end, opts)
		vim.keymap.set({ "n" }, "<leader>r<Space>", function()
			fzf.lsp_references({})
		end, opts)
		vim.keymap.set({ "n" }, "<leader>i<Space>", function()
			fzf.lsp_implementations({})
		end, opts)
		vim.keymap.set({ "n" }, "<leader>c<Space>", function()
			fzf.lsp_live_workspace_symbols({})
		end, opts)
		vim.keymap.set({ "n" }, "d<Space>", function()
			fzf.lsp_workspace_diagnostics({})
		end, opts)
	end,
})

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#000000" })
local cmp = require("cmp")
cmp.setup({
	completion = { autocomplete = false },
	preselect = cmp.PreselectMode.None,
	-- view = {
	--     entries = { name = 'custom', selection_order = 'near_cursor' }
	-- },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-U>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-D>"] = cmp.mapping.scroll_docs(4), -- Down
		-- Auto-confirm when only 1 entry
		["<C-N>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if #cmp.get_entries() == 1 then
					cmp.confirm({ select = true })
				else
					cmp.select_next_item()
				end
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
				if #cmp.get_entries() == 1 then
					cmp.confirm({ select = true })
				end
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lsp_signature_help" },
	},
})

vim.keymap.set({ "i", "s" }, "<C-L>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	luasnip.jump(-1)
end, { silent = true })

vim.diagnostic.config({ virtual_lines = { current_line = true } })
vim.keymap.set({ "n" }, "<leader>ld", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.disable()
	else
		vim.diagnostic.enable()
	end
end, { silent = true })

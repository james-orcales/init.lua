require("mason-lspconfig").setup({})

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

nvim_lsp.pyright.setup({ capabilities = capabilities })
nvim_lsp.jsonls.setup({ capabilities = capabilities })
nvim_lsp.ols.setup({
	capabilities = capabilities,
	init_options = {
		checker_args = "-strict-style -vet -vet-cast -disallow-do",
	},
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
		vim.keymap.set({ "n", "i" }, "<C-K>", vim.lsp.buf.signature_help, opts)

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "lC", vim.lsp.buf.incoming_calls, opts)
		vim.keymap.set("n", "le", function()
			vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
		end, opts)

		vim.keymap.set({ "n", "v" }, "lc", fzf.lsp_code_actions, opts)
		vim.keymap.set({ "n" }, "ls", fzf.lsp_document_symbols, opts)
		vim.keymap.set({ "n" }, "lS", fzf.lsp_live_workspace_symbols, opts)
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

vim.diagnostic.config({ virtual_lines = { current_line = true } })
vim.keymap.set("n", "ld", vim.diagnostic.setqflist, opts)

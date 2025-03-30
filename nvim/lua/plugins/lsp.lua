return {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		opts = {},
	},
	{ "hrsh7th/nvim-cmp", event = { "InsertEnter", "CmdlineEnter" } },
	"hrsh7th/cmp-nvim-lsp",
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				go = { "golangcilint" },
				json = { "jsonlint" },
				yml = { "actionlint" },
				yaml = { "actionlint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					yml = { "yamlfmt" },
					yaml = { "yamlfmt" },
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fs.normalize("~/.local/share/nvim/mason/bin/codelldb"),
					args = { "--port", "${port}" },
				},
				name = "codelldb",
			}
			vim.keymap.set("n", "<S-M-Q>", dap.terminate)
			vim.keymap.set("n", "<S-M-N>", dap.continue)
			vim.keymap.set("n", "<S-M-B>", dap.toggle_breakpoint)
			vim.keymap.set("n", "<S-M-Down>", dap.step_over)
			vim.keymap.set("n", "<S-M-Up>", dap.step_back)
			vim.keymap.set("n", "<S-M-Right>", dap.step_into)
			vim.keymap.set("n", "<S-M-Left>", dap.step_out)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}

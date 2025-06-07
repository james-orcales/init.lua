return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.opt.background = "dark"
			local rosepine = require("rose-pine")
			rosepine.setup({
				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		ft = { "markdown", "codecompanion" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local path_with_location = function()
				local cwd = vim.fs.basename(vim.fn.getcwd())
				local file = vim.api.nvim_buf_get_name(0)
				local relative_path = vim.fn.fnamemodify(file, ":.") -- relative to cwd
				local location = string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))

				local status = ""
				if vim.bo.modified then
					status = "[MODIFIED]"
				elseif vim.bo.readonly then
					status = "[READ ONLY]"
				elseif file == "" then
					status = "[NO NAME]"
				end

				return string.format("%s/%s(%s) %s", cwd, relative_path, location, status)
			end
			require("lualine").setup({
				extensions = { "oil" },
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
						oil = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { path_with_location },
					lualine_x = { "encoding", "fileformat" },
					lualine_y = { "filetype" },
					lualine_z = { "progress" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}

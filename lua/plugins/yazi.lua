return {
	enable = false,
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"tt",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = "?",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}

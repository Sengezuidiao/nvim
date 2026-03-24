return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = { "c", "cpp", "json", "lua", "python", "bash" },
		heightlight = { enable = true },
	}
}

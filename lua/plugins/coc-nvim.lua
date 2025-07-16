return {
	"neoclide/coc.nvim",
	branch = "release",
	config = function()
		vim.g.coc_global_extensions = {
			"coc-json",
			"coc-markdownlint",
			"coc-cmake",
			"coc-translator",
			"coc-snippets",
			"coc-vimlsp",
		}
	end,
}

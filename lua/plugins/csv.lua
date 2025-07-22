return {
	"chrisbra/csv.vim",
	ft = "csv",
	init = function()
		vim.g.csv_autocmd_arrange = 1
		vim.g.csv_nomap_cr = 1
		vim.g.csv_highlight_column = 'y'
	end,
}

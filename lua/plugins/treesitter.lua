return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- 新版不支持懒加载
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		-- 安装/补齐解析器（异步，缺的自动补）
		require("nvim-treesitter").install({
			"c", "cpp", "lua", "vim", "python", "bash", "json",
			"markdown", "markdown_inline", -- markdown 渲染必需
		})
		-- 新版需要手动启用 treesitter 高亮。只对装了 parser 的文件类型启用，
		-- 并用 pcall 兜底：无 parser 的 ft（如 yazi、terminal）或 parser 还没异步装完时都不报错
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp", "lua", "vim", "python", "sh", "bash", "json", "markdown" },
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}

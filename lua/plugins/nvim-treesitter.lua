return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- 安装或更新 parser
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"c", "cpp", "lua", "vim", "python", "bash", "json", "html", "javascript", "qmljs", "tsx"
		},
		auto_install = true,
		highlight = {
			enable = true, -- 启用语法高亮
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true, -- 启用缩进模块
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- 初始化选择
				node_incremental = "grn", -- 增加到下一个节点
				scope_incremental = "grc", -- 增加作用域
				node_decremental = "grm", -- 减少选择
			},
		},
	},
}

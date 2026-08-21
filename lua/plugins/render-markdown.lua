return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		-- 只在这些模式下渲染；插入模式(i)不渲染，显示纯源码
		render_modes = { "n", "c", "t" },
		-- 关闭「光标所在行自动翻回源码」，普通模式下光标移到哪都保持渲染
		anti_conceal = {
			enabled = false,
		},
		-- 简洁预设：去掉标题图标、sign 栏图标、checkbox 花哨渲染（LazyVim 同款）
		preset = "lazy",
		-- 标题文字带底色，但只垫到文字结束，不铺满整行（有强调感又不花哨）
		heading = {
			width = "block",
		},
		-- 列表符保持 - / * 原文，不用 ● ○ ◆ 这类图标
		bullet = {
			enabled = false,
		},
	},
}

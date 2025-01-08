return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- 自动更新 Treesitter 语言文件
  -- event = { "BufReadPost", "BufNewFile" }, -- 按需加载，提高启动速度
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- 可选依赖，根据需要添加
    "p00f/nvim-ts-rainbow", -- 彩虹括号支持
  },
  config = function()
    require 'nvim-treesitter.install'.prefer_git = false
    -- 指定编译器
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" },
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vim",
        "bash",
        "c",
        "cpp",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "tsx",
        "css",
        "rust",
        "markdown",
        "markdown_inline",
      }, -- 安装需要的语言支持
      highlight = { enable = true }, -- 启用语法高亮
      indent = { enable = true }, -- 启用智能缩进
      rainbow = {
        enable = true, -- 启用彩虹括号
        extended_mode = true, -- 彩虹扩展模式（包括括号外的符号）
        max_file_lines = nil, -- 文件行数限制
      },
    })
  end,
}

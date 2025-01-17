return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate", -- 自动更新 Treesitter 语言文件
  -- event = { "LazyFile", "VeryLazy" },
  event = { "BufReadPost", "BufNewFile" }, -- 按需加载，提高启动速度
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts_extend = { "ensure_installed" },
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- 可选依赖，根据需要添加
    "p00f/nvim-ts-rainbow", -- 彩虹括号支持
  },
  opts = {
    -- 指定编译器
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
  },
}

return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy", -- 设置为 VeryLazy 事件触发加载插件
    enabled = false,
    opts = {
      -- 定义插件的行为模式
      modes = { insert = true, command = true, terminal = false },
      -- 如果光标后的下一个字符属于这些字符，跳过自动补全
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- 如果光标位于这些 Treesitter 节点中，跳过自动补全
      skip_ts = { "string" },
      -- 如果光标后的下一个字符是闭合符，且闭合符比打开符多，跳过自动补全
      skip_unbalanced = true,
      -- 优化 Markdown 文件的代码块处理
      markdown = true,
    },
    config = function(_, opts)
      require("mini.pairs").setup(opts) -- 初始化插件并应用选项
    end,
  },
}

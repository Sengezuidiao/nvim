return {
  "ellisonleao/gruvbox.nvim", -- 添加gruvbox插件
  enabled = true;
  config = function()
    vim.cmd("colorscheme gruvbox") -- 设置颜色主题为gruvbox
  end,
}

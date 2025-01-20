return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,  -- 延迟加载
  config = function()
    -- 设置编译器
    require'nvim-treesitter.install'.compilers = { "clang", "gcc" }

    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,  -- 启用语法高亮
      },
    }
  end
}

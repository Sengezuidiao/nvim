return {
  "dhruvasagar/vim-table-mode",
  config = function()
    local group = vim.api.nvim_create_augroup("markdown_config", { clear = true })
    -- 在markdown文件类型中设置按键映射
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "markdown",
      callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>tr", ":TableModeRealign<CR>", { noremap = true, silent = true })
      end
    })

    vim.g.table_mode_sort_map = '<leader>mts'
  end
}

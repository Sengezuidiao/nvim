return{
    "dhruvasagar/vim-table-mode",
    config = function()
      vim.cmd([[
        augroup markdown_config
          autocmd!
          autocmd FileType markdown nnoremap <buffer> <leader>tr :TableModeRealign<CR>
        augroup END
      ]], false)
      vim.g.table_mode_sort_map = '<leader>mts'
    end
}

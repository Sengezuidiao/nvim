function compile_and_run()
  -- 保存当前文件
  vim.cmd("write")

  -- 获取当前文件类型
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local output = vim.fn.expand("%:r") -- 不带扩展名的文件名

  if filetype == "c" then
    -- 设置分屏并调整高度
    vim.o.splitbelow = true
    vim.cmd("split | resize -5")
    -- 打开终端并编译运行
    vim.cmd("term gcc " .. filename .. " -o " .. output .. " && time ./" .. output)
  elseif filetype == "cpp" then
    -- 编译
    vim.fn.system("g++ -std=c++11 " .. filename .. " -Wall -o " .. output)
    -- 设置分屏并调整高度
    vim.o.splitbelow = true
    vim.cmd("split | resize -15")
    -- 打开终端运行
    vim.cmd("term ./" .. output)
  else
    print("Unsupported filetype: " .. filetype)
  end
end

-- 将函数绑定到 Ctrl+F5
vim.api.nvim_set_keymap("n", "<C-F5>", ":lua compile_and_run()<CR>", { noremap = true, silent = true })

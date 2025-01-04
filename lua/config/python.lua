-- 获取操作系统类型
local os_type = vim.loop.os_uname().sysname

-- 根据操作系统设置 python3_host_prog
local python3_host_prog

if os_type == "Darwin" then
  -- macOS
  python3_host_prog = vim.fn.stdpath('config') .. '/pynvim/bin/python'
elseif os_type == "Windows" then
  -- Windows
  python3_host_prog = vim.fn.stdpath('config') .. '\\windowsPythonEnv\\neovimpy\\Scripts\\python.exe'
else
  -- 其他操作系统，可根据需求处理
  python3_host_prog = '/path/to/default/python3'
end

-- 设置 python3_host_prog
vim.g.python3_host_prog = python3_host_prog

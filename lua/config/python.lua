local python3_host_prog -- 在外部声明变量

if vim.fn.has("unix") == 1 then
	python3_host_prog = vim.fn.stdpath("config") .. "/pynvim/bin/python"
elseif vim.fn.has("win32") == 1 then
	python3_host_prog = vim.fn.stdpath("config") .. "/pynvim/Scripts/python"
end

-- 设置 python3_host_prog
vim.g.python3_host_prog = python3_host_prog

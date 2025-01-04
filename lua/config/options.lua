local opt = vim.opt

-- disabling the Perl provider
vim.g.loaded_perl_provider = 0
-- 行号
-- opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- vim.cmd[[colorscheme tokyonight-moon]]

-- 光标位置还原到上次关闭文件时的位置
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local last_position = vim.fn.line("'\"")
        if last_position > 1 and last_position <= vim.fn.line("$") then
            vim.api.nvim_command("normal! g'\"")
        end
    end,
})




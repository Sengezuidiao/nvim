vim.g.mapleader = " "
local keymap = vim.keymap

-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>")

-- 格式化
keymap.set("n", "<leader>/", ":Format<CR>")

-- 命令模式快捷键
keymap.set("i", "<C-a>", "<Esc>0i")
keymap.set("i", "<C-e>", "<Esc>A")

-- 窗口管理
keymap.set("n", "<leader><Left>", "<C-w>h")
keymap.set("n", "<leader><Right>", "<C-w>l")
keymap.set("n", "<leader><Up>", "<C-w>k")
keymap.set("n", "<leader><Down>", "<C-w>j")
keymap.set("n", "<leader>q", "<C-w>q>")
keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>+", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>")
-- coc-translator
keymap.set("n", "ts", "<Plug>(coc-translator-p)")
-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "tt", ":NvimTreeToggle<CR>")

-- markdownpreviw
keymap.set("n", "<leader>mr", ":MarkdownPreview<CR>")

-- Ex 模式下采用Emacs风格
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<M-b>", "<S-Left>")
vim.keymap.set("c", "<M-f>", "<S-Right>")

vim.g.mapleader = " "

local keymap = vim.keymap

-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>")

-- 窗口管理
keymap.set("n", "<leader><Left>", "<C-w>h")
keymap.set("n", "<leader><Right>", "<C-w>l")
keymap.set("n", "<leader><Up>", "<C-w>k")
keymap.set("n", "<leader><Down>", "<C-w>j")
keymap.set("n", "<leader>q", "<C-w>q>")
keymap.set("n", "<leader>w", ":w<CR>")

-- coc-translator
keymap.set("n", "ts", "<Plug>(coc-translator-p)")
-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "tt", ":NvimTreeToggle<CR>")

-- markdownpreviw
keymap.set("n", "<leader>mr", ":MarkdownPreview<CR>")

vim.g.mapleader = " "

local keymap = vim.keymap

-- 取消高亮
keymap.set("n", "<leader><CR>", ":nohl<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "tt", ":NvimTreeToggle<CR>")



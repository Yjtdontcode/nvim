vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "<leader>sc", "<C-w>c") -- 垂直新增窗口
-- 文件操作
keymap.set("n", "<leader>ww", "<cmd>w<CR>") -- 写入文件
keymap.set("n", "<leader>qq", "<cmd>q<CR>") -- 退出文件
keymap.set("n", "<leader>w0", "<cmd>w!<CR>") -- 强制写入文件
keymap.set("n", "<leader>q0", "<cmd>q!<CR>") -- 强制退出文件
keymap.set("n", "<leader>wq", "<cmd>wq<CR>") -- 写入并退出文件
keymap.set("n", "<leader>so", "<cmd>so<CR>") -- 重启文件
-- 光标移动
keymap.set("n", "<leader>hh", "^")
keymap.set("n", "<leader>ll", "$")
-- 分屏选择
keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-l>", "<C-w>l")
-- 分屏调整
keymap.set("n", "<A-,>", "<C-w>>")
keymap.set("n", "<A-.>", "<C-w><")
keymap.set("n", "<A-->", "<C-w>-")
keymap.set("n", "<A-=>", "<C-w>+")
-- 插件更新
keymap.set("n", "<leader>pks", "<cmd>PackerSync<CR>")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

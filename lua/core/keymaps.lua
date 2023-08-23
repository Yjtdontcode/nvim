vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("", "<M+e>", "<ESC>")

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 垂直复制窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平复制窗口
keymap.set("n", "<leader>sc", "<C-w>c") -- 关闭窗口
keymap.set("n", "<M-t>", "<C-w>s<cmd>term<CR>") -- 水平新增终端
--打开终端后自动进入插入模式
local term_mode = vim.api.nvim_create_augroup("TERM_MODE", {clear = true})
vim.api.nvim_create_autocmd({"TermOpen"}, {
    pattern = "*",
    group = term_mode,
    command = [[normal i]]
})
-- 从终端模式变为普通模式
keymap.set("t", "<M-t>", "<C-\\><C-n>:bd!<CR>",{silent = true})
-- 文件操作
keymap.set("n", "ww", "<cmd>w<CR>") -- 写入文件
keymap.set("n", "qq", "<cmd>q<CR>") -- 退出文件
keymap.set("n", "W", "<cmd>w!<CR>") -- 强制写入文件
keymap.set("n", "Q", "<cmd>q!<CR>") -- 强制退出文件
keymap.set("n", "wq", "<cmd>wq<CR>") -- 写入并退出文件
-- 光标移动
keymap.set("n", "<leader>hh", "^")
keymap.set("n", "<leader>ll", "$")
-- 分屏选择
keymap.set("n", "<M-h>", "<C-w>h")
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
-- 代码格式化（自动调整缩进）
keymap.set("n", "<leader>=", "ggVG=")
-- 光标向下移动
keymap.set("n", "J", "<C-d>")
keymap.set("n", "K", "<C-u>")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")


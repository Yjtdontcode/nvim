vim.g.mapleader = " " 
local keymap = vim.keymap 
-- ---------- 插入模式 ---------- ---
-- keymap.set("i", "jk", "<ESC>")
-- keymap.set("i", "kj", "<ESC>")
keymap.set("i", "<C-h>", "<ESC>I")
keymap.set("i", "<C-l>", "<ESC>A")
keymap.set("i", "<C-e>", "<ESC><C-e>a")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "<C-/>", "gb")

-- ---------- 正常模式 ---------- ---
keymap.set("n", "J", "") -- delete the keymap of 'J'
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 垂直复制窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平复制窗口
keymap.set("n", "<leader>sc", "<C-w>c") -- 关闭分窗口
keymap.set("n", "<leader>x", "<cmd>bd<CR>") -- 关闭窗口
keymap.set("n", "<leader>tm", "<C-w>s<cmd>term<CR>") -- 水平新增终端
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
keymap.set("n", "<leader>wh", "<C-w>h")
keymap.set("n", "<leader>wj", "<C-w>j")
keymap.set("n", "<leader>wk", "<C-w>k")
keymap.set("n", "<leader>wl", "<C-w>l")
-- 分屏调整
keymap.set("n", "<A-,>", "<C-w>>")
keymap.set("n", "<A-.>", "<C-w><")
keymap.set("n", "<A-- >", "<C-w>-")
keymap.set("n", "<A-= >", "<C-w>+")
-- build and run
keymap.set("n", "<leader>bu", "<C-w>v<cmd>term g++ *.cpp<CR>")
keymap.set("n", "<leader>R", "<cmd>w<CR> <C-w>s <cmd>term gcc *.cpp; ./a.out<CR>")
keymap.set("n", "<leader>rr", "<cmd>w<CR> <C-w>v <cmd>term gcc *.cpp; ./a.out<CR>")
-- dashboard 
keymap.set("n", "<leader>da", "<cmd>Dashboard<CR>")

-- comment
-- keymap.set("n", "<C-/>", "gcc", {noremap = false})
-- 取消高亮
keymap.set("n", "<C-n>", ":nohl<CR>")
-- 插件更新
keymap.set("n", "<leader>pks", "<cmd>PackerSync<CR>")
-- 代码格式化（自动调整缩进）
-- keymap.set("n", "<leader>=", "ggVG=")


--打开终端后自动进入插入模式
local term_mode = vim.api.nvim_create_augroup("TERM_MODE", {clear = true})
vim.api.nvim_create_autocmd({"TermOpen"}, {
    pattern = "*",
    group = term_mode,
    command = [[normal i]]
})
-- 从终端模式变为普通模式

keymap.set("t", "<M-t>", "<C-\\><C-n>:bd!<CR>",{silent = true})
-- plugin of 'runcode'
-- vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

-- keymap of 'lspconfig' --------------------------
-- keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- --------------  switch colorcheme ------------------
keymap.set("n", "<leader>cs", '<cmd>Themery<CR>', {silent = true})

-- ------------------ hop ----------------------
keymap.set("n", "f", "<cmd>HopWord<CR>", {silent = true})
-- keymap.set("n", "fc", "<cmd>HopChar1<CR>", {silent = true})

-- ------------------ folding parentheses ---------------
keymap.set("n", "<leader>fc", "<cmd>foldclose<CR>", {silent = true})
keymap.set("n", "<leader>fo", "<cmd>foldopen<CR>", {silent = true})


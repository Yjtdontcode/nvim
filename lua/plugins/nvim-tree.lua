-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true, -- 不显示隐藏文件
        exclude = { -- 选择显示哪些文件
            ".gitignore",
            -- ".git",
        },
    },
})

-- ------ Exit nvim when the nvim-tree is the last window ----------
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})


-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
--       vim.cmd "quit"
--     end
--   end
-- })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent=true})

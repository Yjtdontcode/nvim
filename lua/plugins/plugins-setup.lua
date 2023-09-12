local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
-- augroup end
-- ]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    use "rebelot/kanagawa.nvim"        -- colorscheme
    use { "ellisonleao/gruvbox.nvim" } -- colorscheme

    use {                              -- nvim 初始界面
        'glepnir/dashboard-nvim',
        -- event = 'VimEnter',
        config = function()
            require('dashboard')
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use
    {
        'nvim-lualine/lualine.nvim', -- 下面的状态栏
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {
        'nvim-treesitter/nvim-treesitter', -- 语法高亮
        run = ':TSUpdate'
    }
    use "p00f/nvim-ts-rainbow"    -- 括号颜色不同

    use "numToStr/Comment.nvim"   -- gcc和gc注释
    use "windwp/nvim-autopairs"   -- 自动补全括号
    use "akinsho/bufferline.nvim" -- bufferline缓冲区
    use "lewis6991/gitsigns.nvim" -- 左侧git提示

    -- ------------- coc.nvim ----------------------------
    -- use {'neoclide/coc.nvim', branch = 'release'}
    -- ---------------------------------------------------

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    }
    -- 自动补全
    use "hrsh7th/nvim-cmp"    -- 提供代码补全选项
    use "hrsh7th/cmp-path"    -- 文件路径
    use "hrsh7th/cmp-buffer"  -- 缓冲区文件
    use "hrsh7th/cmp-cmdline" -- 命令行
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"

    -- snippets
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "rafamadriz/friendly-snippets"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1', -- 文件检索
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use "lukas-reineke/indent-blankline.nvim" -- 高亮代码片段，缩进显示线(下面这个更好用)
    use { "shellRaining/hlchunk.nvim" }

    use 'sunjon/shade.nvim'

    use { 'michaelb/sniprun', run = 'sh ./install.sh' }

    -- ------------------- 运行 ---------------------------
    use 'CRAG666/code_runner.nvim'

    -- ------------------- cursorline --------------------------
    use 'yamatsum/nvim-cursorline'

    -- ------------------ smoothcursor ------------------------
    -- use { 'gen740/SmoothCursor.nvim',
    --     config = function()
    --         require('smoothcursor').setup()
    --     end
    -- }

    -- ----------------- im-select(自动切换英文输入法) ------------------------
    use {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({})
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

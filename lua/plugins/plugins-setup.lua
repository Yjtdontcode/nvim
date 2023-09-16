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

    use {                              -- nvim start page
        'glepnir/dashboard-nvim',
        -- event = 'VimEnter',
        config = function()
            require('dashboard')
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use
    {
        'nvim-lualine/lualine.nvim', -- make status line more fancy
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {
        'nvim-treesitter/nvim-treesitter', -- 语法高亮 highlight syntax
        run = ':TSUpdate'
    }
    use "p00f/nvim-ts-rainbow"    -- 括号颜色不同

    use "numToStr/Comment.nvim"   -- use 'gcc' or 'gc' to comment
    use "windwp/nvim-autopairs"   -- auto complement of bracket
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
    -- auto complement
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
        'nvim-telescope/telescope.nvim', tag = '0.1.1', -- file finder
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use "lukas-reineke/indent-blankline.nvim" -- 高亮代码片段，缩进显示线(下面这个更好用)
    use { "shellRaining/hlchunk.nvim" }

    -- ------------------- 模糊焦点窗口之外的窗口 -----------------------------
    use 'sunjon/shade.nvim'

    use 'CRAG666/code_runner.nvim' -- code runner

    -- ------------------- cursorline --------------------------
    use 'yamatsum/nvim-cursorline'

    use { 'gen740/SmoothCursor.nvim', -- make the curosr move more smoothly
        config = function()
            require('smoothcursor').setup()
        end
    }

    use 'ethanholz/nvim-lastplace' -- auto return back to the last modified place

    use 'rcarriga/nvim-notify' -- make the notify appear top

    use"Kicamon/im-switch.nvim" -- auto switch imputting method to en when exiting 'INSERT' mode

    use 'zaldih/themery.nvim' -- use '<leader>cs' to switch theme rapidly and conveniently BUT it's effort is temporary

    -- ------------------ debug adapator -----------------------
    -- use "ravenxrz/DAPInsatll.nvim" -- help us install several debuggers
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use "theHamsta/nvim-dap-virtual-text"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

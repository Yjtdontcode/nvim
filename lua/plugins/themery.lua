-- -------- colorscheme switcher --------------
-- Minimal config
-- require("themery").setup({
--   themes = {"gruvbox", }, -- Your list of installed colorschemes
--   themeConfigFile = "~/.config/nvim/lua/core/options.lua", -- Described below
--   livePreview = true, -- Apply theme while browsing. Default to true.
-- })

-- Set custom name to the list
-- require("themery").setup({
--   themes = {{
--     name = "Day",
--     colorscheme = "gruvbox light",
--   },
--   {
--     name = "Night",
--     colorscheme = "gruvbox dark",
--   }},
--   -- [...]
-- })

-- Using before and after.
require("themery").setup({
    themes = { {
        name = "Gruvbox dark",
        colorscheme = "gruvbox",
        before = [[
      -- All this block will be executed before apply "set colorscheme"
      vim.opt.background = "dark"
    ]],
    },
        {
            name = "Gruvbox light",
            colorscheme = "gruvbox",
            before = [[
      vim.opt.background = "light"
    ]],
            after = [[-- Same as before, but after if you need it]]
        } },
    -- [...]
})

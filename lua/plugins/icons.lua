local icons = require("nvim-nonicons")

require("telescope").setup({
  defaults = {
    prompt_prefix = "  " .. icons.get("telescope") .. "  ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
  },
})

local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

require("nvim-tree").setup({
  renderer = {
    icons = {
      glyphs = nonicons_extention.glyphs,
    },
  },
})

local icons = require("nvim-nonicons")
local nonicons_extention = require("nvim-nonicons.extentions.lualine")

require("lualine").setup({
  sections = {
    lualine_a = { nonicons_extention.mode },
    lualine_z = {
      {
        "branch",
        icon = icons.get("git-branch"),
      },
    },
  }
})

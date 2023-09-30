require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 100, -- 凸显行背景显示时间
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

-- 变暗焦点窗口以外的窗口
require'shade'.setup({
  overlay_opacity = 35,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>', -- 调节变暗程度
    toggle           = '<Leader>s', -- 开关该插件
  }
})

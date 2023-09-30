-- ----- inputting method switcher -----
require("im-switch").setup({
	im = "fcitx5",
	ft_text = { -- 自动切换输入法的文档
		"*.md",
		"*.txt",
	},
	ft_code = { -- 注释时自动切换输入法的语言
		"*.lua",
		"*.c",
		"*.cpp",
		"*.py",
	},
	fcitx5 = {
		en = "fcitx5-remote -c",
		-- zh = "fcitx5-remote -o",
		check = "fcitx5-remote",
	},
})

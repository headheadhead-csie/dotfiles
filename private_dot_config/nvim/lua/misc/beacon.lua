require('beacon').setup({
	enable = true,
	size = 40,
	fade = true,
	minimal_jump = 10,
	show_jumps = true,
	focus_gained = false,
	shrink = true,
	timeout = 750,
	ignore_buffers = { },
	ignore_filetypes = { "Trouble", "qf", },
})
vim.cmd("hi Beacon guibg=#a4d9e3")

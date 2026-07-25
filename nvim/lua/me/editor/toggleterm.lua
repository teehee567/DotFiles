return {
	'akinsho/toggleterm.nvim',
	version = '*',
	opts = {
		open_mapping = [[<C-\>]],
		direction = 'float',
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		close_on_exit = true,
		autochdir = true,
		float_opts = {
			border = 'curved',
			winblend = 0,
		},
	},
}

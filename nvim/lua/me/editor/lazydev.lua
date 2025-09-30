return {
	{
		'folke/lazydev.nvim',
		priority = 10,
		ft = 'lua',
		opts = {
			library = {
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
				{ path = 'snacks.nvim', words = { 'Snacks' } },
			},
		},
	},
	{ 'Bilal2453/luvit-meta', lazy = true },
}

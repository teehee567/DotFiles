return {
	{
		'williamboman/mason.nvim',
		lazy = true,
		opts = {
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		},
	},
	{
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		event = 'VeryLazy',
		opts = {
			ensure_installed = {
				'prettierd',
				'stylua',
                'ruff',
				'eslint_d',
			},
		},
	},
}

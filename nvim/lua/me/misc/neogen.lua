return {
	'danymat/neogen',
	opts = {
		snippet_engine = 'luasnip',
		languages = {
			python = {
				template = {
					annotation_convention = 'google_docstrings',
				},
			},
		},
	},
	keys = {
		{ '<leader>dcd', function() vim.cmd('Neogen') end, desc = 'Generate documentation' },
		{ '<leader>dcf', function() vim.cmd('Neogen func') end, desc = 'Generate function documentation' },
		{ '<leader>dcc', function() vim.cmd('Neogen class') end, desc = 'Generate class documentation' },
	},
}

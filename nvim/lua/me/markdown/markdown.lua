return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	event = { 'BufReadPre *.md', 'BufNewFile *.md' },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	init = function()
		local cmp = require('cmp')
		cmp.setup.filetype('markdown', {
			sources = cmp.config.sources {
				{ name = 'render-markdown' },
			},
		})
	end,
}

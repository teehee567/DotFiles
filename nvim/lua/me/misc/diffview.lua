return {
	'sindrets/diffview.nvim',
	cmd = 'DiffviewOpen',
	opts = {
        view = {
            merge_tool = {
                layout = 'diff3_mixed',
            }
        }
    },
	keys = {
		{
			'<leader>df',
			function()
				local view = require('diffview.lib').get_current_view()
				if view then
					vim.cmd('DiffviewClose')
				else
					vim.cmd('DiffviewOpen')
				end
			end,
			desc = 'Toggle Diffview',
		},
	},
}

return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	opts = { },
	keys = {
		{
			']h',
			function()
				if vim.wo.diff then
					vim.cmd.normal { ']h', bang = true }
				else
					require('gitsigns').nav_hunk('next')
				end
			end,
			desc = 'Next hunk',
		},

		{
			'[h',
			function()
				if vim.wo.diff then
					vim.cmd.normal { '[h', bang = true }
				else
					require('gitsigns').nav_hunk('prev')
				end
			end,
			desc = 'Prev hunk',
		},
		{ '<leader>hs', function() require('gitsigns').stage_hunk() end, desc = 'Stage hunk', mode = 'n' },
		{ '<leader>hr', function() require('gitsigns').reset_hunk() end, desc = 'Reset hunk', mode = 'n' },
		{
			'<leader>hs',
			function() require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
			desc = 'Stage hunk',
			mode = 'v',
		},
		{
			'<leader>hr',
			function() require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
			desc = 'Reset hunk',
			mode = 'v',
		},
		{ '<leader>hS', function() require('gitsigns').stage_buffer() end, desc = 'Stage buffer', mode = 'n' },
		{ '<leader>hR', function() require('gitsigns').reset_buffer() end, desc = 'Reset buffer', mode = 'n' },
		{ '<leader>hp', function() require('gitsigns').preview_hunk() end, desc = 'Preview hunk', mode = 'n' },
		{
			'<leader>hb',
			function() require('gitsigns').blame_line { full = true } end,
			desc = 'Show blame',
			mode = 'n',
		},
		{
			'<leader>tb',
			function() require('gitsigns').toggle_current_line_blame() end,
			desc = 'Toggle blame',
			mode = 'n',
		},
		{
			'<leader>hd',
			function() require('gitsigns').diffthis() end,
			desc = 'Diff against current revision',
            mode = 'n',
		},
		{
			'<leader>hD',
			function() require('gitsigns').diffthis('~') end,
			desc = 'Diff against prev revision',
			mode = 'n',
		},
		{ 'ih', function() require('gitsigns').select_hunk() end, desc = 'Select hunk', mode = { 'o', 'x' } },
	},
}

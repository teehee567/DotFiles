return {
	'folke/snacks.nvim',
	opts = function()
		local utils = require('me.utils.dashboard_utils')
		local harpoons = utils.gen_harpoon()
		local cdir = vim.fn.getcwd()
        local banner = utils.pick_banner()
		return {
			dashboard = {
				enabled = true,
				preset = {
					---@type snacks.dashboard.Item[]
					keys = {
						{
							icon = ' ',
							key = 'f',
							desc = 'Find File',
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{
							icon = ' ',
							key = 'n',
							desc = 'New File',
							action = ':ene | startinsert',
						},
						{
							icon = ' ',
							key = 'g',
							desc = 'Find Text',
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = ' ',
							key = 'r',
							desc = 'Recent Files',
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = ' ',
							key = 'c',
							desc = 'Config',
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{
							icon = ' ',
							key = 'g',
							desc = 'Lazygit',
							action = ':lua Snacks.lazygit()',
						},
						{
							icon = '󰒲 ',
							key = 'L',
							desc = 'Lazy',
							action = ':Lazy',
							enabled = package.loaded.lazy ~= nil,
						},
						{
							icon = ' ',
							key = 'q',
							desc = 'Quit',
							action = ':qa',
						},
					},
				},
				sections = {
					{
						{
							pane = 1,
							{
								section = 'terminal',
								ttl = 0,
								indent = 16,
								padding = 2,
								cmd = 'cat ' .. vim.fn.stdpath('config') .. '/assets/yousoro.txt',
								enabled = banner == 'yousoro',
								width = 87,
								height = 10,
							},
							{
								section = 'terminal',
								ttl = 0,
								indent = 26,
								padding = 2,
								cmd = 'chafa -p off --format symbols --clear --passthrough=tmux ' .. vim.fn.stdpath(
									'config'
								) .. '/assets/soyo.gif',
								enabled = banner == 'soyo',
								width = 100,
								height = 20,
							},
							{
								section = 'terminal',
								ttl = 0,
								indent = 28,
								padding = 2,
								cmd = 'chafa -p off --format symbols --clear --passthrough=tmux ' .. vim.fn.stdpath(
									'config'
								) .. '/assets/morts.gif',
                                enabled = banner == 'morts',
								width = 100,
								height = 20,
							},
						},
						{
							section = 'keys',
							gap = 1,
							padding = 1,
						},
						{
							{
								text = '',
								padding = 15,
								enabled = banner == 'yousoro',
							},
							{
								text = '',
								padding = 5,
								enabled = banner == 'soyo' or banner == 'morts',
							},
						},
						{
							section = 'startup',
							indent = 60,
							padding = 5,
						},
					},
					{
						pane = 2,
						{
							{
								text = '',
								padding = 11,
                                enabled = banner == 'yousoro',
							},
							{
								text = '',
								padding = 21,
								enabled = banner == 'soyo' or banner == 'morts'
							},
						},
						{
							title = 'Recent Files',
							icon = ' ',
							section = 'recent_files',
							indent = 2,
							padding = 1,
						},
						{
						title = ('⥤  Harpoons: %d active'):format(#require("harpoon"):list().items),
						padding = 0,
						},
						{
							utils.gen_file_list(harpoons, function(i) return ('h%d'):format(i) end, cdir),
							indent = 2,
							padding = 1,
						},
					},
				},
			},
		}
	end,
}

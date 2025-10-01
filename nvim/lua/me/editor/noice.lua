return {
	'folke/noice.nvim',
    priority = 10,
	event = 'VeryLazy',
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
		{ 'smjonas/inc-rename.nvim', opts = {} },
	},
	keys = {
		{ '<leader>nl', function() require('noice').cmd('last') end, desc = 'Open last notif' },
		{ '<leader>nh', function() require('noice').cmd('history') end, desc = 'Open notif history' },
		{ '<leader>nc', function() require('noice').cmd('dismiss') end, desc = 'Dismiss notifs' },
		{ '<leader>ne', function() require('noice').cmd('errors') end, desc = 'Open errors' },
	},
	opts = {
		routes = {
			{ view = 'notify', filter = { event = 'msg_showmode' } },
		},
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
--        popupmenu = {
--            enabled = true,
--            backend = "cmp",
--            kind_icons = {},
--        },
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
			lsp_doc_border = true,
		},
		cmdline = {
			opts = {
				position = { row = '60%' },
			},
			format = {
				cmdline = { conceal = false },
				search_down = {
					opts = { position = { row = '100%' } },
				},
				search_up = {
					opts = { position = { row = '100%' } },
				},
				filter = { conceal = false },
				lua = { conceal = false },
				help = { conceal = false },
			},
			messages = {
				enabled = true,
				view = 'notify',
				view_error = 'notify',
				view_warn = 'notify',
				view_history = 'messages',
				view_search = 'virtualtext',
			},
		},
	},
}

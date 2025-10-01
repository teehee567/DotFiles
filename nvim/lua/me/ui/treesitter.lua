return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'RRethy/nvim-treesitter-textsubjects',
		'nvim-treesitter/playground',
	},
	build = ':TSUpdate',
	opts = function()
		local opts = {
			ignore_install = {},
			modules = {},
			ensure_installed = {
				'python',
				'c',
				'cpp',
				'lua',
				'regex',
				'latex',
				'rust',
				'bash',
				'markdown',
				'markdown_inline',
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			textsubjects = {
				enable = true,
				prev_selection = '\\',
				keymaps = {
					['<CR>'] = 'textsubjects-smart',
					['"'] = 'textsubjects-container-outer',
					["'"] = 'textsubjects-container-inner',
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
					},
					selection_modes = {},
				},
				swap = {
					enable = true,
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						[']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
						[']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
					},
				},
			},
		}

		local txtobj_keys = {
			['@function'] = 'f',
			['@class'] = 'c',
			['@loop'] = 'l',
			['@parameter'] = 'o',
			['@conditional'] = 'y',
			-- ['@call'] = 'c',
			['@comment'] = 'm',
		}
		local txtobj_opts = {
			select = {
				keymaps = {},
			},
			swap = { swap_next = {}, swap_previous = {} },
			move = {
				goto_next_start = {},
				goto_next_end = {},
				goto_previous_start = {},
				goto_previous_end = {},
				goto_next = {},
				goto_previous = {},
			},
		}
		local swap_command = '<leader>sw'
		local swap_previous_command = '<leader>ws'
		local wk = require('which-key')
		for txtobj, alias in pairs(txtobj_keys) do
			txtobj_opts.select.keymaps['i' .. alias] = txtobj .. '.inner'
			txtobj_opts.select.keymaps['a' .. alias] = txtobj .. '.outer'
			for attr, a in pairs { [txtobj .. '.inner'] = alias, [txtobj .. '.outer'] = alias:upper() } do
				txtobj_opts.swap.swap_next[swap_command .. a] = attr
				txtobj_opts.swap.swap_previous[swap_previous_command .. a] = attr
				txtobj_opts.move.goto_next[']' .. a .. a] = attr
				txtobj_opts.move.goto_next_start[']' .. a .. '['] = attr
				txtobj_opts.move.goto_next_end[']' .. a .. ']'] = attr
				txtobj_opts.move.goto_previous['[' .. a .. a] = attr
				txtobj_opts.move.goto_previous_start['[' .. a .. '['] = attr
				txtobj_opts.move.goto_previous_end['[' .. a .. ']'] = attr
				wk.add {
					{ ']' .. a, group = txtobj },
					{ '[' .. a, group = txtobj },
				}
			end
		end
		return vim.tbl_deep_extend('force', opts, { textobjects = txtobj_opts })
	end,
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
	init = function()
		local file_ext_augroup = vim.api.nvim_create_augroup('CustomFileExts', {})
		vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
			pattern = '*.purs',
			callback = function() vim.bo.filetype = 'purescript' end,
			group = file_ext_augroup,
		})
	end,
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = "BufReadPost",
      opts = {
        max_lines = 3,
        multiline_thresold = 1,
        trim_scope = "outer",
      }
    }
}

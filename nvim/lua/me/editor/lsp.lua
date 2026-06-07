local function on_attach(_, bufnr)
	require('which-key').add {
		buffer = bufnr,

		{ '<leader>k', vim.lsp.buf.hover, desc = 'Hover', mode = 'n' },
		{ '<leader>l', vim.diagnostic.open_float, desc = 'Open diagnostic float', mode = 'n' },
		{ '<leader>.', vim.lsp.buf.code_action, desc = 'Code actions', mode = 'n' },

		{
			'<leader>rn',
			function()
				return ':IncRename ' .. vim.fn.expand('<cword>')
			end,
			desc = 'Rename variable',
			mode = 'n',
			expr = true,
		},

		{ '<C-s>', vim.lsp.buf.signature_help, desc = 'Signature help', mode = 'i' },

		{
			']e',
			function()
				vim.diagnostic.jump { count = 1, float = true }
			end,
			desc = 'Next diagnostic',
			mode = 'n',
		},
		{
			'[e',
			function()
				vim.diagnostic.jump { count = -1, float = true }
			end,
			desc = 'Previous diagnostic',
			mode = 'n',
		},
	}
end

return {
	{
		'williamboman/mason.nvim',
		opts = {},
	},

	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig',
		},
		opts = {
			ensure_installed = {
				'clangd',
			},

			-- We enable clangd manually below after configuring it.
			automatic_enable = false,
		},
	},

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			{
				'antosha417/nvim-lsp-file-operations',
				dependencies = {
					'nvim-lua/plenary.nvim',
					'nvim-neo-tree/neo-tree.nvim',
				},
				opts = {},
			},
		},
		config = function()
			local capabilities = vim.tbl_deep_extend(
				'force',
				vim.lsp.protocol.make_client_capabilities(),
				require('cmp_nvim_lsp').default_capabilities(),
				require('lsp-file-operations').default_capabilities()
			)

			vim.lsp.config('clangd', {
				cmd = {
					'clangd',
					'--background-index',
					'--clang-tidy',
				},

				on_attach = on_attach,
				capabilities = capabilities,

				filetypes = {
					'c',
					'cpp',
					'objc',
					'objcpp',
					'cuda',
				},

				root_markers = {
					'.clangd',
					'.clang-tidy',
					'.clang-format',
					'compile_commands.json',
					'compile_flags.txt',
					'configure.ac',
					'.git',
				},
			})

			vim.lsp.enable('clangd')

			vim.diagnostic.config {
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = '',
						[vim.diagnostic.severity.WARN] = '',
						[vim.diagnostic.severity.INFO] = '',
						[vim.diagnostic.severity.HINT] = '󰌵',
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = false,
					style = 'minimal',
					border = 'rounded',
					source = 'if_many',
					header = '',
					prefix = '',
				},
			}
		end,
	},

	{
		'mrcjkb/rustaceanvim',
		version = '^6',
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = on_attach,
				},
			}
			vim.lsp.inlay_hint.enable(true)
		end,
	},

	{ 'j-hui/fidget.nvim', opts = {} },
}

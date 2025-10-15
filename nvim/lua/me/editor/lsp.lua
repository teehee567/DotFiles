local function on_attach(_, bufnr)
	require('which-key').add {
		buffer = bufnr,
		{ '<leader>k', function() vim.lsp.buf.hover() end, desc = 'Hover', mode = 'n' },

		{ '<leader>l', vim.diagnostic.open_float, desc = 'Open diagnostic float', mode = 'n' },

		{ '<leader>.', vim.lsp.buf.code_action, desc = 'Code actions', mode = 'n' },
		{
			'<leader>rn',
			---@diagnostic disable-next-line: redundant-return-value
			function() return ':IncRename ' .. vim.fn.expand('<cword>') end,
			desc = 'Rename variable',
			mode = 'n',
			expr = true,
		},
		{ '<C-s>', vim.lsp.buf.signature_help, desc = 'Focus help', mode = 'i' },
		{
			'[e',
			function() vim.diagnostic.jump { count = 1, float = true } end,
			desc = 'Next diagnostic',
			mode = 'n',
		},
		{
			']e',
			function() vim.diagnostic.jump { count = -1, float = true } end,
			desc = 'Previous diagnostic',
			mode = 'n',
		},
	}
end

return {
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = true,
		dependencies = {
			'williamboman/mason.nvim',
			{
				'antosha417/nvim-lsp-file-operations',
				dependencies = {
					'nvim-lua/plenary.nvim',
					'nvim-neo-tree/neo-tree.nvim',
				},
				opts = {},
			},
		},
		opts = function()
			local capabilities = vim.tbl_deep_extend(
				'force',
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require('cmp_nvim_lsp').default_capabilities(),
				require('lsp-file-operations').default_capabilities()
			)

			return {
				automatic_installation = false,
				ensure_installed = {
					'clangd',
				},
				handlers = {
                    vim.lsp.config("clangd", {
                        on_attach = on_attach,
                        capabilities = capabilities,
                        -- init_options = {
                        --     semanticHighlighting = true,
                        -- },
                    })
				},
			}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/nvim-cmp',
		},
		init = function()
			vim.diagnostic.config {
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = '',
						[vim.diagnostic.severity.WARN] = '',
						[vim.diagnostic.severity.INFO] = '',
						[vim.diagnostic.severity.HINT] = '󰌵',
					},
				},
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
                    on_attach = on_attach
                },
			}
            vim.lsp.inlay_hint.enable(true)
		end,
	},
	{ 'j-hui/fidget.nvim', opts = {} },
}

return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
			javascript = { 'prettierd' },
			typescript = { 'prettierd' },
			purescript = { 'purs-tidy' },
			c = { 'clang_format' },
			cs = { 'csharpier' },
			zsh = { 'beautysh' },
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			yaml = { 'prettierd' },
			latex = { 'latexindent' },
			java = { 'google-java-format' },
			fortran = { 'findent', 'fprettify' },
			elm = { 'elm_format' },
			php = { 'pretty-php' },
			ruby = { 'rubyfmt' },
			go = { 'goimports' },
			rust = { 'rustfmt', lsp_format = 'fallback' },
			asm = { 'asmfmt' },
			['*'] = { 'injected', 'trim_whitespace' },
		},
	},
	init = function()
		vim.api.nvim_create_user_command('Format', function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					['end'] = { args.line2, end_line:len() },
				}
			end
			require('conform').format { async = true, lsp_fallback = true, range = range }
		end, { range = true })
	end,
	keys = {
		{ '<leader>f', function() vim.cmd('Format') end, desc = 'Format' },
	},
}

return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	opts = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local function smartcase_filter(entry, ctx)
			local input = string.sub(ctx.cursor_before_line, entry:get_offset())
			if input == string.lower(input) then
				return true
			end

			-- nvim-cmp normally matches without regard to case. Once the input
			-- contains a capital, only keep matches whose casing is exact.
			for _, match in ipairs(entry.matches or {}) do
				if match.strict_ratio ~= 1 then
					return false
				end
			end
			return true
		end

		-- getcompletion() filters command names case-sensitively before nvim-cmp
		-- sees them. Supplying the full command list lets cmp provide smart-case
		-- completion for built-in and user commands alike.
		local command_source = {}
		function command_source:get_keyword_pattern()
			return [=[[^[:blank:]]*]=]
		end

		function command_source:complete(params, callback)
			if not params.context.cursor_before_line:match('^[A-Za-z][A-Za-z0-9]*$') then
				callback({ items = {}, isIncomplete = false })
				return
			end

			local items = {}
			for _, command in ipairs(vim.fn.getcompletion('', 'command')) do
				items[#items + 1] = {
					label = command,
					kind = cmp.lsp.CompletionItemKind.Function,
				}
			end
			callback({ items = items, isIncomplete = false })
		end

		cmp.register_source('smart_cmdline', command_source)

		cmp.setup.cmdline(':', {
			mapping = (function()
				local cmdline_mapping = cmp.mapping.preset.cmdline()
				cmdline_mapping['<Tab>'] = cmp.mapping(function()
					if cmp.visible() then
						if not cmp.get_selected_entry() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						end
						cmp.confirm({ select = true })
					else
						cmp.complete()
					end
				end, { 'c' })
				cmdline_mapping['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end, { 'c' })
				return cmdline_mapping
			end)(),
			sources = cmp.config.sources(
				{
					{ name = 'path', entry_filter = smartcase_filter },
				},
				{
					{ name = 'smart_cmdline', entry_filter = smartcase_filter },
					{
						name = 'cmdline',
						entry_filter = function(entry, ctx)
							-- The smart source owns a plain first command token;
							-- cmp-cmdline still handles ranges, modifiers and args.
							if ctx.cursor_before_line:match('^[A-Za-z][A-Za-z0-9]*$') then
								return false
							end
							return smartcase_filter(entry, ctx)
						end,
					},
				}
			),

			matching = { disallow_symbol_nonprefix_matching = false },
		})

		return {
			snippet = {
				expand = function(args) luasnip.lsp_expand(args.body) end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			mapping = cmp.mapping.preset.insert {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),

				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),

				["<C-e>"] = cmp.mapping {
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				},

				['<C-Space>'] = cmp.mapping.complete(),
				['~'] = cmp.mapping.abort(),
				['|'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm {
								select = true,
							}
						end
					else
						fallback()
					end
				end),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if entry then
                            cmp.confirm({ select = false })
                            return
                        end
                    end

                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's', 'c' }),

				['<S-Tab>'] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					elseif cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { 'i', 's' }),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)

					--NOTE: ass dont use
					--
					-- local extracted = vim_item.menu
					-- if not extracted then
					--     extracted = " "
					-- end
					--
					-- local extracted_content = string.match(extracted, "%(use%s+(.-)%)")
					-- if extracted_content then
					--     extracted_content = " (" .. extracted_content .. ")"
					-- else
					--     extracted_content = " "
					-- end
					-- vim_item.abbr = string.sub(vim_item.abbr:match("[^(]+"), 1, 20) .. extracted_content

					vim_item.abbr = string.sub(vim_item.abbr, 1, 60)
					vim_item.menu = ""
				return vim_item
				end,
				expandable_indicator = true
			},
			sources = cmp.config.sources(
				{
					name = 'lazydev'
				}, {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
			}),
		}
	end,
	config = function(_, opts) require('cmp').setup(opts) end,
}

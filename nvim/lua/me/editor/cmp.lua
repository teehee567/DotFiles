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
					-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							cmp.confirm()
						end
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, {"i","s","c",}),

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

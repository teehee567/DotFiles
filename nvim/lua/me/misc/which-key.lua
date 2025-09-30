return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {
		preset = 'modern',
        ---@param mapping wk.Mapping
		filter = function(mapping)
            if not mapping.desc then
                return true
            elseif mapping.desc:match('Harpoon [2-9]') then
                return false
            end
            return true
		end,
		keys = {
			scroll_down = '<c-d>',
			scroll_up = '<c-u>',
		},
		---@type wk.Spec
		spec = {
			{
				noremap = true,
				silent = true,
			},
		},
	},
	keys = {
		{
			'<leader>?',
			function() require('which-key').show { global = false } end,
			desc = 'Buffer Local Keymaps (which-key)',
		},
	},
}

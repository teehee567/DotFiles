return {
	'folke/snacks.nvim',
	priority = 1000,
	opts = {
		---@class snacks.image.Config
		image = {
			enabled = true,
			math = {
				latex = {
					font_size = 'normalsize',
				},
			},
		},
	},
}

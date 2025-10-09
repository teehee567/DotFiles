return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_c = {
                    -- WARN: needs double brackets
                    {
                        'filename',
                        path = 1,
                    }
                }
            }
        })
    end
}

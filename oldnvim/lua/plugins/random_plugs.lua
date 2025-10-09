return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    { 'folke/which-key.nvim',  opts = {} },
    { 'numToStr/Comment.nvim', opts = {} },


    -- NOTE: Whitespace trimming
    -- {
    --     "cappyzawa/trim.nvim",
    --     config = function()
    --         require('trim').setup({
    --             ft_blocklist = { "markdown" },
    --             trim_last_line = false,
    --             trim_first_line = false,
    --         })
    --     end
    -- }
}

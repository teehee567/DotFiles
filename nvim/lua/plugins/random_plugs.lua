return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    { 'folke/which-key.nvim',  opts = {} },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        "cappyzawa/trim.nvim",
        config = function()
            require('trim').setup({
                ft_blocklist = { "markdown" },
            })
        end
    }
}


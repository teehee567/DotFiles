return {
    "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup()
        -- require('hlslens').setup() is not required
        require("scrollbar.handlers.search").setup({
            -- hlslens config overrides
        })
    end,
}
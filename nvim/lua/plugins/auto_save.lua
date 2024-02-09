return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                -- if vim.api.nvim_get_mode().mode == 'i' then
                --     return false
                -- end

                if fn.getbufvar(buf, "&modifiable") == 1 and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                return false    -- can't save
            end,
        })
    end,
}
return {
    "windwp/nvim-autopairs",
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
        local Rule = require('nvim-autopairs.rule')
        local npairs = require('nvim-autopairs')
        local cond = require('nvim-autopairs.conds')

        require("nvim-autopairs").setup {}
        -- If you want to automatically add `(` after selecting a function or method
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        npairs.add_rules({
            Rule("$", "$", { "tex", "markdown" })
                :with_pair(function(opts)
                    print(vim.inspect(opts))
                    if opts.line == "aa $$" then
                        -- don't add pair on that line
                        return false
                    end
                end)
                :with_move(cond.not_before_regex("xxx", 3))
        }
        )
    end,
}

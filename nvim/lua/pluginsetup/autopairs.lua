local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')


npairs.add_rules({
  Rule("$","$",{"tex", "markdown"})
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
        -- don't add pair on that line
          return false
        end
    end)
    :with_move(cond.not_before_regex("xxx", 3))
   }
)

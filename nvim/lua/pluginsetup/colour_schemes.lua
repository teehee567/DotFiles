
require("catppuccin").setup({
    -- transparent_background = true,
    no_italic = true,
    no_bold = true,

    custom_highlights = function()
        return {
            Delimiter = { fg = "#8bd5ca" },
            ["@punctuation.bracket"] = { fg = "#DDDDDD"},
            LineNR = { fg = "#8087a2"},
        }
    end,

    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {}, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
    }

})

vim.cmd.colorscheme "catppuccin-macchiato"

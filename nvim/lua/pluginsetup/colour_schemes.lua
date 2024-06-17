require("catppuccin").setup({
    -- transparent_background = true,
    flavour = "macchiato",

    no_italic = true,
    no_bold = true,

    custom_highlights = function()
        return {
            Delimiter = { fg = "#8bd5ca" },
            ["@punctuation.bracket"] = { fg = "#DDDDDD"},
            LineNr = { fg = "#8087a2"},
        }
    end,

    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
    }

})

vim.cmd.colorscheme "catppuccin-macchiato"

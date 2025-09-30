return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    transparent_background = false,
    term_colors = true,
    no_italic = true,
    -- styles = {
    --   comments = { "" },
    --   conditionals = { "italic" },
    -- },
    -- custom_highlights = function(C)
    --   return {
    --     NormalFloat = { bg = "NONE" },
    --     FloatBorder  = { bg = "NONE" },
    --     NormalNC     = { bg = "NONE" },
    --   }
    -- end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
  end,
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
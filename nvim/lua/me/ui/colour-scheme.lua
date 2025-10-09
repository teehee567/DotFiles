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
    custom_highlights = function(C)
      return {
        CursorLineNr = { fg = C.lavender, bold = true },
        LineNr = { fg = C.subtext1 },
      }
    end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

local function nvimtree_on_attach(bufnr)
  local api = require "nvim-tree.api"
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  vim.keymap.set('n', 'l', api.node.open.edit, opts('back'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('open'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('vertical open tab'))
  vim.keymap.set('n', 'e', function() api.tree.expand_all() end, opts('expand all for selection'))
end

require("nvim-tree").setup {
  actions = {
    open_file = {
        quit_on_open = true,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "󰌶",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 500,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
    on_attach = nvimtree_on_attach,
  }

return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
    execution_message = { enabled = false },
    -- Optional: fewer triggers + debounce reduces races
    trigger_events = { "InsertLeave", "TextChanged" },
    debounce_delay = 1000,

    condition = function(buf)
        -- 1) hard gate: the *passed* bufnr must be valid & loaded
        if type(buf) ~= "number" then return false end
        if not vim.api.nvim_buf_is_valid(buf) then return false end
        if not vim.api.nvim_buf_is_loaded(buf) then return false end

        -- 2) safely read options from that same buffer
        local ok_bt, buftype = pcall(vim.api.nvim_buf_get_option, buf, "buftype")
        if not ok_bt or buftype ~= "" then return false end

        local ok_mod, modifiable = pcall(vim.api.nvim_buf_get_option, buf, "modifiable")
        if not ok_mod or not modifiable then return false end

        local ok_ro, readonly = pcall(vim.api.nvim_buf_get_option, buf, "readonly")
        if not ok_ro or readonly then return false end

        -- 3) must have a name (skip scratch/temporary)
        local name = vim.api.nvim_buf_get_name(buf)
        if name == "" then return false end

        -- 4) exclude UI/special filetypes that often race
        local ft = (vim.bo[buf] or {}).filetype
        local exclude_ft = {
        ["neo-tree"] = true, ["neo-tree-popup"] = true, ["NvimTree"] = true,
        harpoon = true, help = true, qf = true, trouble = true, Outline = true,
        TelescopePrompt = true, noice = true, notify = true, spectre_panel = true,
        terminal = true, toggleterm = true, ["dap-repl"] = true,
        gitcommit = true, gitrebase = true,
        }
        if exclude_ft[ft] then return false end

        return true
    end,
    })

  end,
}

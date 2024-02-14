return {
    "lervag/vimtex",
    ft = {"tex", "cls"},
    init = function()
        if vim.loop.os_uname().sysname:find("Windows") then
            vim.g.vimtex_view_general_viewer = 'SumatraPDF'
        else
            -- vim.g.vimtex_view_general_viewer = 'skim'
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_view_sync = 1
        end
        vim.g.vimtex_view_general_options_latexmk = '-reuse-instance'
        vim.g.vimtex_view_automatic = 1
        vim.g.vimtex_syntax_enabled = 1
    end
}

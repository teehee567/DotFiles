return {
    "lervag/vimtex",
    ft = {"tex", "cls"},
    init = function()
        if vim.loop.os_uname().sysname:find("Windows") then
            vim.g.vimtex_view_general_viewer = 'SumatraPDF'
        else
            vim.g.vimtex_view_general_viewer = 'zathura'
        end
        vim.g.vimtex_view_general_options_latexmk = '-reuse-instance'
    end
}

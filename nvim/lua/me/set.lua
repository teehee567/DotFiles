vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.clipboard = 'unnamedplus'
if vim.loop.os_uname().sysname:find("Windows") then
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

vim.opt.nu = true

vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.wo.signcolumn = 'number'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guifont = 'FiraCode Nerd Font Mono'

vim.o.updatetime = 50

vim.o.termguicolors = true
-- vim.cmd[[colorscheme catppuccin-macchiato]]

vim.opt.guicursor = "n-v-c-sm:block,i-ci:ver20-linkwait300-blinkoff50-blinkon200,r-cr-o:hor20"

-- vim.cmd('set pumheight=11')

-- -- For lualine
vim.opt.cmdheight = 0
vim.opt.showcmdloc = 'statusline'
vim.opt.showmode = false

if vim.g.neovide then
    if vim.loop.os_uname().sysname == "Darwin" then
        vim.g.neovide_scale_factor = 1
        vim.g.neovide_fullscreen = true
        vim.g.neovide_input_macos_alt_is_meta = true
    else
        vim.g.neovide_scale_factor = 0.65
        vim.g.neovide_title_background_color = string.format(
            "%x",
            vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
        )
    end
    -- vim.g.neovide_transparency = 0.75

    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
    -- vim.g.neovide_cursor_vfx_mode = "railgun"
end
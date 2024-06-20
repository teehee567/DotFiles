



-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
if vim.loop.os_uname().sysname:find("Windows") then
-- if vim.fn.has("win64") then
    -- print("hihihihihihi")
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end


-- Transparency

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'number'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 600

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


if vim.loop.os_uname().sysname == "Darwin" then
end
vim.opt.guifont = 'FiraCode Nerd Font Mono'

-- Colours
vim.o.termguicolors = true
vim.cmd[[colorscheme catppuccin-macchiato]]

-- changed to be in colour config
-- vim.cmd('hi Delimiter guifg=#8bd5ca') -- : & 
-- vim.cmd('hi @punctuation.bracket guifg=#DDDDDD') -- brackets and () {} #f5bde6
-- vim.cmd('hi LineNr guifg=#8087a2')
vim.cmd('set pumheight=11')
vim.cmd('set splitright')

-- line numbers
vim.wo.number = true
vim.opt.relativenumber = true

-- Cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci:ver20-linkwait300-blinkoff50-blinkon200,r-cr-o:hor20"

-- tabsetup
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true




if vim.g.neovide then
    if vim.loop.os_uname().sysname == "Darwin" then
        vim.g.neovide_scale_factor = 1
        vim.g.neovide_fullscreen = true
        vim.g.neovide_input_macos_alt_is_meta = true
    else
        vim.g.neovide_scale_factor = 0.65
    end
    -- vim.g.neovide_transparency = 0.75

    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
    -- vim.g.neovide_cursor_vfx_mode = "railgun"
end


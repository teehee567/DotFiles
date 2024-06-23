-- NOTE: center after C-u/C-d
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<gd", "<cmd>lua vim.lsp.buf.definition()<CR>zz", { noremap = true, silent = true })

-- Code actions
vim.keymap.set('n','<leader>.', "<cmd>lua vim.lsp.buf.code_action()<CR>")

--clear search
vim.keymap.set('n','<leader>h', "<cmd>nohlsearch<CR>", {noremap = true})

-- Better window movement
vim.keymap.set('n', "<C-h>", "<C-w>h")
vim.keymap.set('n', "<C-j>", "<C-w>j")
vim.keymap.set('n', "<C-k>", "<C-w>k")
vim.keymap.set('n', "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set('n', "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set('n', "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set('n', "<C-Left>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set('n', "<C-Right>", ":vertical resize -2<CR>", { silent = true })

-- Toggle tree
vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", { desc = "toggle tree explorer"})

-- yank all
vim.keymap.set('n', '<leader>y', "<cmd>%y<CR>", { desc = "yank all"})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- close with leader
vim.keymap.set('n', '<leader>q', "<cmd>confirm q<CR>", { desc = 'close shit'})

-- comment line
vim.keymap.set('v', "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "comment line"})

-- Move current line / block with Alt-j/k a la vscode.
vim.keymap.set({'n', 'i'}, "<A-j>", ":m .+1<CR>==")
vim.keymap.set({'n', 'i'}, "<A-k>", ":m .-2<CR>==")

-- normal person ctrl backspace
if vim.g.neovide then
    vim.keymap.set({ 'i', 'c' }, '<C-Backspace>', '<C-w>')
else
    vim.keymap.set({ 'i', 'c' }, '<C-H>', '<C-w>')
end

-- Better Indent
vim.keymap.set('v', "<", "<gv")
vim.keymap.set('v', ">", ">gv")

-- if vim.fn.has("win64") then
if vim.loop.os_uname().sysname:find("Windows") then
    vim.keymap.set('n', '<leader>lc', '<cmd>edit ' .. os.getenv("HOMEPATH") .. '/Appdata/Local/nvim/<CR>')
else
    vim.keymap.set('n', '<leader>lc', '<cmd>edit ' .. os.getenv("HOME") .. '/.config/nvim/<CR>')
end

--telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
    require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- document existing key chains
require('which-key').register {
    ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
    ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
    ['<leader>'] = { name = 'VISUAL <leader>' },
    ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })



local dialogfloat = function()
    local float = vim.diagnostic.config().float

    if float then
        local config = type(float) == "table" and float or {}
        config.scope = "line"

        vim.diagnostic.open_float(config)
    end
end

vim.keymap.set('n', '<leader>l', dialogfloat)


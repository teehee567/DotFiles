local map = vim.keymap.set

-- ===== Scrolling & LSP defs (center after move) =====
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Half-page down" })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Half-page up" })

-- NOTE: your original had "<gd" (missing '>'); assuming you meant normal "gd"
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>zz", { noremap = true, silent = true, desc = "LSP: Go to Definition (center)" })

-- ===== Code actions =====
-- map("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP: Code Action" })

-- ===== Clear search =====
map("n", "<leader>h", function()
  vim.cmd.nohlsearch()
  vim.api.nvim_echo({ { "" } }, false, {})
end, { desc = "Search: Clear highlights", silent = true })

-- ===== Better window movement =====
map("n", "<C-h>", "<C-w>h", { desc = "Window: Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window: Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window: Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window: Right" })

-- ===== Resize with arrows =====
map("n", "<C-Up>", function() vim.cmd("resize -2") end, { silent = true, desc = "Window: Shrink height" })
map("n", "<C-Down>", function() vim.cmd("resize +2") end, { silent = true, desc = "Window: Grow height" })
map("n", "<C-Left>", function() vim.cmd("vertical resize +2") end, { silent = true, desc = "Window: Grow width" })
map("n", "<C-Right>", function() vim.cmd("vertical resize -2") end, { silent = true, desc = "Window: Shrink width" })

-- ===== NvimTree toggle =====
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Tree: Toggle Explorer" })

-- ===== Yank all =====
-- map("n", "<leader>y", "<cmd>%y<CR>", { desc = "Yank: Whole Buffer" })

-- ===== Wrapped line movement =====
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move Up (wrap-aware)" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move Down (wrap-aware)" })

-- ===== Diagnostics navigation =====
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic: Previous" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic: Next" })

-- ===== Quit =====
map("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit: Confirm" })

-- ===== Terminal quality-of-life =====
map("t", "<C-v>", '<C-\\><C-n>"+pi', { desc = "Terminal: Paste from system clipboard" })
map("t", "<C-BS>", "<C-w>", { desc = "Terminal: Backward delete word" })

-- ===== Comment =====
-- NORMAL: toggle comment on the current line
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment: Toggle linewise (current line)" })

-- VISUAL: toggle comment on the selection and stay in visual mode
map('x', '<leader>/', 'gcgv', { remap = true, desc = 'Comment: toggle (visual, keep selection)' })

-- ===== Move line/block with Alt-j/k =====
-- NORMAL
map({ "n" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map({ "n" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line up"   })

-- INSERT (stay in insert after moving)
map({ "i" }, "<A-j>", "<C-o>:m .+1<CR><C-o>==", { desc = "Move line down" })
map({ "i" }, "<A-k>", "<C-o>:m .-2<CR><C-o>==", { desc = "Move line up"   })

-- VISUAL (preserve selection)
map({ "v" }, "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map({ "v" }, "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ===== Better search =====
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- ===== Better copy paste =====
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]],          { desc = "Yank line to system clipboard" })

-- Paste from system clipboard
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard (after)" })
map({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste from system clipboard (before)" })

-- ===== Normal-person Ctrl-Backspace =====
if vim.g.neovide then
  map({ "i", "c" }, "<C-Backspace>", "<C-w>", { desc = "Delete previous word" })
else
  map({ "i", "c" }, "<C-H>", "<C-w>", { desc = "Delete previous word" })
end

-- ===== Better indent reselect =====
map("v", "<", "<gv", { desc = "Indent left (keep selection)" })
map("v", ">", ">gv", { desc = "Indent right (keep selection)" })


-- ===== Misc =====
map("n", "Q", "<nop>", { desc = "Disabled Q", silent = true })
map("n", "U", "<nop>", { desc = "Disabled U", silent = true })

map("n", "<leader>qa", ":qa!<CR>", { desc = "Quit all", silent = true })
map("n", "<leader>qq", ":q!<CR>",  { desc = "Quit",     silent = true })

-- ===== Open config quickly (platform-aware) =====
if vim.loop.os_uname().sysname:find("Windows") then
  map("n", "<leader>lc", "<cmd>edit " .. os.getenv("HOMEPATH") .. "/Appdata/Local/nvim/<CR>", { desc = "Config: Edit (Windows)" })
else
  map("n", "<leader>lc", "<cmd>edit " .. os.getenv("HOME") .. "/.config/nvim/<CR>", { desc = "Config: Edit (Unix)" })
end

-- ===== Telescope =====
-- local tb = require("telescope.builtin")
-- map("n", "<leader>?", tb.oldfiles, { desc = "Search: Recent files" })
-- map("n", "<leader><space>", tb.live_grep, { desc = "Search: Live Grep" })
-- map("n", "<leader>ss", tb.builtin, { desc = "Search: Telescope pickers" })
-- map("n", "<leader>gf", tb.git_files, { desc = "Search: Git files" })
-- map("n", "<leader>sf", tb.find_files, { desc = "Search: Files" })
-- map("n", "<leader>sh", tb.help_tags, { desc = "Search: Help tags" })
-- map("n", "<leader>sw", tb.grep_string, { desc = "Search: Word under cursor" })
-- map("n", "<leader>sg", tb.live_grep, { desc = "Search: Live Grep (project)" })
-- map("n", "<leader>sb", tb.buffers, { desc = "Search: Buffers" })
-- map("n", "<leader>sG", ":LiveGrepGitRoot<CR>", { desc = "Search: Grep at Git Root" })
-- map("n", "<leader>sd", tb.diagnostics, { desc = "Search: Diagnostics" })
-- map("n", "<leader>sr", tb.resume, { desc = "Search: Resume last picker" })

-- map("n", "<leader>/", function()
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     winblend = 10,
--     previewer = false,
--   }))
-- end, { desc = "Search: Fuzzy in current buffer" })

-- local function telescope_live_grep_open_files()
--   require("telescope.builtin").live_grep({
--     grep_open_files = true,
--     prompt_title = "Live Grep in Open Files",
--   })
-- end

-- ===== Diagnostic float on current line =====
-- local function dialogfloat()
--   local float = vim.diagnostic.config().float
--   if float then
--     local config = type(float) == "table" and float or {}
--     config.scope = "line"
--     vim.diagnostic.open_float(config)
--   end
-- end
-- map("n", "<leader>l", dialogfloat, { desc = "Diagnostic: Line float" })

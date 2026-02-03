# VS Code Configuration

This VS Code configuration is designed to replicate the Neovim setup as closely as possible.

## Installation

### 1. Install Extensions

First, install all the recommended extensions. You can do this by:

**Option A: Command Line**
```bash
# Core
code --install-extension vscodevim.vim
code --install-extension catppuccin.catppuccin-vsc
code --install-extension catppuccin.catppuccin-vsc-icons

# LSP & Languages
code --install-extension rust-lang.rust-analyzer
code --install-extension ms-vscode.cpptools
code --install-extension sumneko.lua
code --install-extension ms-python.python
code --install-extension charliermarsh.ruff
code --install-extension golang.go
code --install-extension esbenp.prettier-vscode

# Git
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension chaitanyashahare.lazygit

# Navigation & UI
code --install-extension alefragnani.bookmarks
code --install-extension alefragnani.numbered-bookmarks
code --install-extension vspacecode.whichkey
code --install-extension gruntfuggly.todo-tree
code --install-extension usernamehw.errorlens
code --install-extension naumovs.color-highlight
code --install-extension oderwat.indent-rainbow
code --install-extension streetsidesoftware.code-spell-checker
```

**Option B: Copy extensions.json**
Copy `extensions.json` to your project's `.vscode/` folder and VS Code will prompt you to install them.

### 2. Copy Configuration Files

Copy the configuration files to your VS Code user settings folder:

**Linux:**
```bash
cp settings.json ~/.config/Code/User/settings.json
cp keybindings.json ~/.config/Code/User/keybindings.json
```

**macOS:**
```bash
cp settings.json ~/Library/Application\ Support/Code/User/settings.json
cp keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

**Windows:**
```powershell
copy settings.json $env:APPDATA\Code\User\settings.json
copy keybindings.json $env:APPDATA\Code\User\keybindings.json
```

## Key Mappings

The keybindings are designed to match the Neovim configuration. Leader key is `<Space>`.

### Core Navigation

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Ctrl+h/j/k/l` | Focus window left/down/up/right | `<C-w>h/j/k/l` |
| `Ctrl+Arrow` | Resize window | `:resize` commands |
| `Space e` | Toggle file explorer | `:Neotree toggle` |
| `Space q` | Close current editor | `:quit` |

### LSP Actions

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `gd` | Go to definition | `vim.lsp.buf.definition()` |
| `gD` | Go to declaration | `vim.lsp.buf.declaration()` |
| `gr` | Find references | `vim.lsp.buf.references()` |
| `gI` | Go to implementation | `vim.lsp.buf.implementation()` |
| `gy` | Go to type definition | `vim.lsp.buf.type_definition()` |
| `Space .` | Code actions | `vim.lsp.buf.code_action()` |
| `Space k` | Hover documentation | `vim.lsp.buf.hover()` |
| `Space rn` | Rename symbol | `:IncRename` |
| `Space l` | Show diagnostics | `vim.diagnostic.open_float()` |
| `]e` / `[e` | Next/prev diagnostic | `vim.diagnostic.goto_next/prev()` |
| `Ctrl+s` (insert) | Signature help | `vim.lsp.buf.signature_help()` |

### Editing

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Space /` | Toggle comment | `Comment.api.toggle` |
| `Alt+j/k` | Move line down/up | `:m .+1/:m .-2` |
| `Space f` | Format document | `:Format` |
| `<` / `>` (visual) | Indent left/right (keeps selection) | `<gv` / `>gv` |

### Search (Snacks Picker Equivalents)

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Space Space` | Quick open (smart find) | `Snacks.picker.smart()` |
| `Space ,` | Show all editors (buffers) | `Snacks.picker.buffers()` |
| `Space /` | Find in files (grep) | `Snacks.picker.grep()` |
| `Space :` | Command palette | `Snacks.picker.command_history()` |
| `Space sf` | Find files | `Snacks.picker.files()` |
| `Space sg` | Grep in project | `Snacks.picker.grep()` |
| `Space sd` | Show problems | `Snacks.picker.diagnostics()` |
| `Space ss` | Go to symbol | `Snacks.picker.lsp_symbols()` |
| `Space sS` | Search workspace symbols | `Snacks.picker.lsp_workspace_symbols()` |
| `Space sk` | Open keybindings | - |
| `Space sw` | Search word under cursor | `Snacks.picker.grep_word()` |

### Git (Gitsigns Equivalents)

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Space gs` | Git status | `Snacks.picker.git_status()` |
| `Space gd` | Git diff | `gitsigns.diffthis()` |
| `Space gb` | Git checkout branch | `Snacks.picker.git_branches()` |
| `Space gl` | Git log | `Snacks.picker.git_log()` |
| `Space hb` | Toggle line blame | `gitsigns.blame_line()` |
| `Space tb` | Toggle file blame | `gitsigns.toggle_current_line_blame()` |
| `Space hs` | Stage hunk | `gitsigns.stage_hunk()` |
| `Space hr` | Reset hunk | `gitsigns.reset_hunk()` |
| `]h` / `[h` | Next/prev hunk | `gitsigns.nav_hunk()` |

### Harpoon Equivalents (Bookmarks)

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Space a` | Toggle bookmark | `harpoon:list():add()` |
| `Ctrl+e` | List bookmarks | `harpoon.ui:toggle_quick_menu()` |
| `Space h1-9` | Jump to bookmark 1-9 | `harpoon:list():select(n)` |
| `Space hc` | Clear all bookmarks | `harpoon:list():clear()` |

### Toggles (Snacks Toggles Equivalents)

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Space us` | Toggle spell check | `Snacks.toggle.option('spell')` |
| `Space uw` | Toggle word wrap | `Snacks.toggle.option('wrap')` |
| `Space ul` | Toggle line numbers | `Snacks.toggle.line_number()` |
| `Space uh` | Toggle inlay hints | `Snacks.toggle.inlay_hints()` |
| `Space ug` | Toggle whitespace rendering | `Snacks.toggle.indent()` |
| `Space uC` | Select color theme | `Snacks.picker.colorschemes()` |

### Other

| Keybinding | Action | Neovim Equivalent |
|------------|--------|-------------------|
| `Space lg` | Open Lazygit | `Snacks.lazygit()` |
| `Space ?` | Show which-key | `which-key.show()` |
| `Space lc` | Open settings JSON | Edit nvim config |
| `Space pj` | Recent projects | `Snacks.picker.projects()` |
| `Space n` | Show notifications | `Snacks.picker.notifications()` |
| `Space z` | Toggle zen mode | - |
| `Space v` | Split editor right | - |

## Theme

The configuration uses **Catppuccin Macchiato** theme to match the Neovim setup. The theme provides:
- Beautiful, easy-on-the-eyes colors
- Consistent syntax highlighting
- File icons that match the color scheme

## Font

The configuration uses **FiraCode Nerd Font Mono** with ligatures enabled. Install it from:
- [Nerd Fonts](https://www.nerdfonts.com/)
- Or via package manager: `brew install font-fira-code-nerd-font` (macOS)

## Features Comparison

| Neovim Plugin | VS Code Equivalent |
|---------------|-------------------|
| lazy.nvim | Built-in extension manager |
| catppuccin | Catppuccin extension |
| neo-tree | Built-in Explorer + File Utils |
| nvim-cmp | Built-in IntelliSense |
| nvim-lspconfig | Language extensions |
| treesitter | Built-in + Semantic Highlighting |
| gitsigns | GitLens |
| telescope/snacks.picker | Quick Open + Search |
| harpoon | Bookmarks extension |
| which-key | Which Key extension |
| Comment.nvim | Built-in (Ctrl+/) |
| vim-surround | VSCodeVim surround |
| flash.nvim | VSCodeVim easymotion |
| conform.nvim | Formatters per language |
| todo-comments | TODO Tree extension |
| lualine | Built-in Status Bar |
| noice.nvim | Built-in notifications |

## Notes

1. **Vim Extension**: The VSCodeVim extension is essential and provides most Vim functionality including surround, easymotion, and leader key support.

2. **Some features don't have direct equivalents**:
   - Neovim's full customization is unmatched
   - Some plugins like treesitter-textobjects have limited support
   - Harpoon functionality is approximated with bookmarks

3. **Relative line numbers**: Enabled by default to match the nvim config.

4. **Auto-save**: Enabled with 1 second delay (like auto_save.lua).

5. **Format on save**: Disabled by default (use `Space f` to format).

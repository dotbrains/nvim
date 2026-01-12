# Plugin Organization

Plugins are organized into logical categories for better maintainability and discoverability.

## 📁 Directory Structure

```
plugins/
├── ui/           # User interface and appearance
├── editor/       # Editor enhancements and navigation
├── lsp/          # Language servers and syntax
├── git/          # Git integrations
├── terminal/     # Terminal emulators
├── completion/   # Code completion and snippets
├── debug/        # Debugging tools
└── init.lua      # Core plugin setup
```

## 📦 Categories

### `ui/` - UI & Appearance (10 plugins)

Theme, statusline, bufferline, dashboard, icons, and visual enhancements.

**Themes:**
- `nord.lua` - Nord theme (default)
- `gruvbox.lua` - Gruvbox theme

**Status & Navigation:**
- `lualine.lua` - Fast statusline with theme integration
- `barbar.lua` - Tabline/bufferline with clickable tabs

**Start Screen:**
- `alpha.lua` - Customizable greeter/dashboard

**Visual Aids:**
- `indent-blankline.lua` - Indent guides
- `nvim-colorizer.lua` - Color highlighter (shows hex colors)
- `nvim-web-devicons.lua` - File type icons
- `whichkey.lua` - Displays keybindings on `<leader>`
- `noice.lua` - Enhanced command line UI

---

### `editor/` - Editor Enhancements (14 plugins)

Navigation, editing tools, file exploration, and productivity features.

**Navigation & Search:**
- `telescope.lua` - Fuzzy finder for files, text, buffers, and more
- `harpoon.lua` - Quick file switching (mark important files)
- `leap-nvim.lua` - Lightning-fast motion plugin

**File Explorers:**
- `nvim-tree.lua` - File explorer sidebar
- `minimap.lua` - Code minimap

**Editing:**
- `comment.lua` - Toggle comments (gcc, gbc)
- `nvim-autopairs.lua` - Auto-close brackets, quotes, etc.
- `vim-illuminate.lua` - Highlight word under cursor

**Productivity:**
- `true-zen.lua` - Distraction-free modes (focus, minimalist, etc.)
- `trouble-nvim.lua` - Pretty diagnostics, references, and quickfix list
- `goto-preview.lua` - Preview definitions without jumping
- `peek.lua` - Markdown preview
- `headlines.lua` - Enhanced markdown headlines

**Integration:**
- `vim-tmux-navigator.lua` - Seamless navigation between vim and tmux

---

### `lsp/` - LSP & Language Tools (8 plugins)

Language servers, formatting, linting, and syntax highlighting.

**LSP Management:**
- `mason.lua` - LSP server installer GUI
- `mason-lspconfig.lua` - Bridge between mason and lspconfig
- `nvim-lspconfig.lua` - Quickstart configs for LSP servers
- `lspsaga-nvim.lua` - Enhanced LSP UI (floating windows, code actions)

**Formatting & Linting:**
- `none-ls.lua` - Use Neovim as a language server (formatting, diagnostics)
- `formatter.lua` - File formatting on save

**Syntax & Parsing:**
- `nvim-treesitter.lua` - Advanced syntax highlighting and code understanding
- `nvim-ts-autotag.lua` - Auto-close/rename HTML tags

---

### `git/` - Git Integration (4 plugins)

Version control tools for seamless Git workflows.

- `vim-fugitive.lua` - Powerful Git commands within Neovim
- `lazygit.lua` - LazyGit TUI integration
- `gitsigns-nvim.lua` - Git signs in gutter (added/modified/deleted lines)
- `git-worktree.lua` - Git worktree management

---

### `terminal/` - Terminal (2 plugins)

Integrated terminal emulators.

- `fterm.lua` - Floating terminal
- `nvterm.lua` - Terminal plugin with toggleable terminals

---

### `completion/` - Completion & Snippets (2 plugins)

Code completion and snippet management.

- `copilot.lua` - GitHub Copilot AI pair programmer
- `luasnip.lua` - Snippet engine with custom snippet support

---

### `debug/` - Debugging (3 plugins)

Debug Adapter Protocol (DAP) support.

- `nvim-dap.lua` - Debug Adapter Protocol client
- `nvim-dap-python.lua` - Python debugging support
- `nio.lua` - Async I/O library for DAP

---

## 🎨 Theme Switching

This configuration includes a dynamic theme switcher:

- **Default theme:** Nord
- **Alternative theme:** Gruvbox
- **Toggle:** `<leader>tt`
- **Auto-sync:** Lualine and other UI components automatically update

### Adding a New Theme

1. Create a new file in `ui/` (e.g., `ui/catppuccin.lua`)
2. Add the theme plugin configuration
3. Update `lua/config/theme.lua` and add the theme name to the `themes` table
4. Restart Neovim and use `<leader>tt` to cycle through themes

---

## 🔧 Plugin Management

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

**Common commands:**
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install/update/clean plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for updates

**Features:**
- Lazy loading for fast startup
- Automatic plugin discovery in subdirectories
- Lock file for reproducible installs
- Plugin profiling with `:Lazy profile`

---

## 📚 Adding Plugins

1. Create a new `.lua` file in the appropriate category directory
2. Return a plugin specification table:

```lua
return {
	"author/plugin-name",
	lazy = true,  -- lazy load
	event = "VeryLazy",  -- load trigger
	config = function()
		-- Plugin configuration
		require("plugin-name").setup({})
	end,
}
```

3. Restart Neovim - lazy.nvim will automatically detect and install the plugin

---

## 🛠️ Troubleshooting

**Plugin not loading?**
- Check `:Lazy` for errors
- Run `:checkhealth` for diagnostics
- Ensure file is in correct directory

**Theme not switching?**
- Verify theme is installed: `:Lazy`
- Check `lua/config/theme.lua` configuration
- Run `:lua require('config.theme').set_theme('theme-name')`

**LSP not working?**
- Run `:LspInfo` to see active servers
- Check `:Mason` for installed language servers
- Run `:checkhealth lsp` for diagnostics

---

For more information, see the main [README](../../README.md) or [KEYBINDINGS](../../KEYBINDINGS.md).

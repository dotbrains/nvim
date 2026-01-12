# ⌨️ Keybindings Reference

This document provides a comprehensive list of all custom keybindings in this Neovim configuration.

**Note:** `<leader>` is mapped to the spacebar by default.

## 📑 Table of Contents

- [Buffer Navigation](#buffer-navigation)
- [File Explorer](#file-explorer)
- [Window Navigation](#window-navigation)
- [Window Management](#window-management)
- [Telescope](#telescope)
- [Git](#git)
- [LSP](#lsp)
- [Editing](#editing)
- [Zen Mode](#zen-mode)
- [Theme](#theme)
- [Terminal](#terminal)
- [Comments](#comments)
- [Miscellaneous](#miscellaneous)

---

## Buffer Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>bn` | Next buffer | Switch to next buffer |
| Normal | `<leader>bp` | Previous buffer | Switch to previous buffer |
| Normal | `<leader>bb` | Alternate buffer | Switch to last buffer |
| Normal | `<leader>` ` | Alternate buffer | Switch to last buffer (alternative) |

---

## File Explorer

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>e` | Toggle NvimTree | Open/close file explorer |
| Normal | `<leader>m` | Focus NvimTree | Focus the file explorer |

---

## Window Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<C-h>` | Navigate left | Move to left window |
| Normal | `<C-j>` | Navigate down | Move to window below |
| Normal | `<C-k>` | Navigate up | Move to window above |
| Normal | `<C-l>` | Navigate right | Move to right window |
| Terminal | `<C-h>` | Navigate left | Move to left window from terminal |
| Terminal | `<C-j>` | Navigate down | Move to window below from terminal |
| Terminal | `<C-k>` | Navigate up | Move to window above from terminal |
| Terminal | `<C-l>` | Navigate right | Move to right window from terminal |

**Note:** These also work with Tmux via vim-tmux-navigator.

---

## Window Management

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>sv` | Vertical split | Split window vertically |
| Normal | `<leader>sh` | Horizontal split | Split window horizontally |
| Normal | `<C-Up>` | Increase height | Increase window height by 2 |
| Normal | `<C-Down>` | Decrease height | Decrease window height by 2 |
| Normal | `<C-Left>` | Decrease width | Decrease window width by 2 |
| Normal | `<C-Right>` | Increase width | Increase window width by 2 |

---

## Telescope

Telescope provides fuzzy finding for files, text, and more.

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>ff` | Find files | Find files in project |
| Normal | `<leader>fg` | Live grep | Search text in project |
| Normal | `<leader>fb` | Find buffers | List open buffers |
| Normal | `<leader>fh` | Help tags | Search help documentation |
| Normal | `<leader>fo` | Old files | Recently opened files |

---

## Git

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>gg` | LazyGit | Open LazyGit interface |
| Normal | `<leader>gs` | Git status | Show git status |
| Normal | `<leader>gc` | Git commit | Create git commit |
| Normal | `<leader>gb` | Git blame | Show git blame |
| Normal | `<leader>gd` | Git diff | Show git diff |
| Normal | `<leader>gh` | Git hunk | Preview git hunk |

---

## LSP

Language Server Protocol keybindings for code intelligence.

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `gd` | Go to definition | Jump to definition |
| Normal | `gD` | Go to declaration | Jump to declaration |
| Normal | `gr` | References | Show references |
| Normal | `gi` | Go to implementation | Jump to implementation |
| Normal | `K` | Hover documentation | Show documentation |
| Normal | `<leader>ca` | Code actions | Show code actions |
| Normal | `<leader>rn` | Rename | Rename symbol |
| Normal | `<leader>f` | Format | Format code |
| Normal | `[d` | Previous diagnostic | Jump to previous diagnostic |
| Normal | `]d` | Next diagnostic | Jump to next diagnostic |
| Normal | `<leader>q` | Diagnostic list | Open diagnostic list |

---

## Editing

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Visual | `<` | Dedent | Decrease indentation (stays in visual mode) |
| Visual | `>` | Indent | Increase indentation (stays in visual mode) |
| Normal | `<C-_>` | Toggle comment | Comment/uncomment line |
| Visual | `<C-_>` | Toggle comment | Comment/uncomment selection |

**Note:** `<C-_>` is triggered by `Ctrl+/` on most keyboards.

---

## Zen Mode

Distraction-free coding modes using True Zen.

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>zn` | Narrow | Focus on current function/block |
| Visual | `<leader>zn` | Narrow selection | Focus on visual selection |
| Normal | `<leader>sm` | Focus | Focus on current split |
| Normal | `<leader>zm` | Minimalist | Minimalist mode |
| Normal | `<leader>za` | Ataraxis | Distraction-free mode |

---

## Theme

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>tt` | Toggle theme | Switch between Nord and Gruvbox |

---

## Terminal

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>t` | Toggle terminal | Open/close floating terminal |
| Terminal | `<Esc>` | Normal mode | Enter normal mode in terminal |

---

## Comments

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<C-_>` | Toggle comment | Comment/uncomment current line |
| Visual | `<C-_>` | Toggle comment | Comment/uncomment selection |
| Normal | `gcc` | Toggle line comment | Comment/uncomment line |
| Normal | `gbc` | Toggle block comment | Comment/uncomment block |

---

## Miscellaneous

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>pa` | Show path | Display full file path |
| Normal | `<leader>w` | Save | Save current file |
| Normal | `<leader>q` | Quit | Quit window |

---

## Plugin-Specific Keybindings

### Harpoon

Fast file navigation:

- `<leader>ha` - Add file to Harpoon
- `<leader>hh` - Toggle Harpoon menu
- `<leader>1` - Navigate to file 1
- `<leader>2` - Navigate to file 2
- `<leader>3` - Navigate to file 3
- `<leader>4` - Navigate to file 4

### Trouble

Diagnostics viewer:

- `<leader>xx` - Toggle Trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `<leader>xl` - Location list
- `<leader>xq` - Quickfix list

---

## Tips

- **Learn incrementally**: Start with buffer navigation, file explorer, and Telescope
- **Use WhichKey**: Press `<leader>` and wait to see available keybindings
- **Customize**: Edit `lua/config/keymaps.lua` to modify these bindings

---

For more information, see the [README](README.md) or explore the configuration files in `lua/config/`.

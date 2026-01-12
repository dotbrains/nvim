# Changelog

All notable changes to this Neovim configuration will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- **Theme Switching System** - Dynamic theme switching between Nord and Gruvbox
  - New `lua/config/theme.lua` module for managing themes
  - Keybinding `<leader>tt` to toggle between themes
  - Automatic lualine theme synchronization when switching themes
  - Support for adding additional themes easily
- **Organized Plugin Structure** - Reorganized flat plugin directory into categories:
  - `ui/` - UI and appearance plugins (themes, statusline, etc.)
  - `editor/` - Editor enhancements (telescope, file explorers, etc.)
  - `lsp/` - LSP and language tools (mason, treesitter, etc.)
  - `git/` - Git integrations (lazygit, fugitive, gitsigns)
  - `terminal/` - Terminal emulators (fterm, nvterm)
  - `completion/` - Completion and snippets (copilot, luasnip)
  - `debug/` - Debugging tools (nvim-dap)
- **Gruvbox Theme** - Added gruvbox as a secondary theme option
- **Comprehensive Documentation**
  - Enhanced root README.md with better structure and features list
  - New KEYBINDINGS.md with complete keybinding reference
  - Plugin organization README in `lua/plugins/README.md`
  - This CHANGELOG.md to track changes
  - CONTRIBUTING.md with development guidelines
  - `.github/README.md` documenting workflows and templates
- **Installation Script** - Automated setup script with dependency checking
  - macOS support via Homebrew
  - Debian/Ubuntu support via apt-get
  - Automatic OS detection
  - Interactive dependency installation
- **Health Check** - Custom health check script to verify dependencies
- **Makefile** - Common tasks automation (format, lint, install, etc.)
- **Improved .gitignore** - More comprehensive patterns for nvim-specific files
- **GitHub Actions Workflows**
  - CI pipeline for linting and testing
  - Automated releases on tag push
  - Weekly plugin update checks
  - Stale issue/PR management
- **Issue & PR Templates**
  - Bug report template
  - Feature request template
  - Pull request template
- **Docker Testing** - Dockerfile.test for testing on Ubuntu/Debian environments

### Changed
- **lualine Configuration** - Now uses dynamic theme from theme module instead of hardcoded Nord
- **Plugin Loading** - Theme initialization now happens after lazy.nvim loads all plugins
- **README Location** - Moved from `.github/README.md` to root `README.md`

### Removed
- **Disabled Plugins** - Removed commented-out plugin files:
  - `ui/dashboard.lua` (was disabled in favor of alpha.nvim)
  - `ui/bufferline.lua` (was disabled in favor of barbar.nvim)
  - `editor/neo-tree.lua` (was disabled in favor of nvim-tree.lua)

### Fixed
- Theme consistency across UI components when switching themes
- Lualine now properly updates when theme changes

## Previous Changes

Configuration existed before structured changelog. See git history for earlier changes.

---

## Categories

- **Added** - New features
- **Changed** - Changes in existing functionality
- **Deprecated** - Soon-to-be removed features
- **Removed** - Removed features
- **Fixed** - Bug fixes
- **Security** - Security fixes

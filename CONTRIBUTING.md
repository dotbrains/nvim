# Contributing to nvim Configuration

Thank you for your interest in contributing to this Neovim configuration! This document provides guidelines and instructions for contributing.

## 🎯 Ways to Contribute

- Report bugs
- Suggest new features or enhancements
- Improve documentation
- Submit bug fixes
- Add new plugins
- Optimize existing configurations
- Share your customizations

## 🐛 Reporting Bugs

Before creating a bug report:

1. **Check existing issues** to avoid duplicates
2. **Update to the latest version** and test if the bug still exists
3. **Run `:checkhealth`** to identify potential issues

When reporting a bug, please use the bug report template and include:

- Clear description of the bug
- Steps to reproduce
- Expected vs. actual behavior
- Environment details (OS, Neovim version, terminal, shell)
- Error messages from `:checkhealth`
- Screenshots (if applicable)

## 💡 Suggesting Features

Before suggesting a feature:

1. **Check existing feature requests** to avoid duplicates
2. **Consider if it aligns** with the project's goals (minimal, organized, performant)

Use the feature request template and include:

- Clear description of the feature
- Problem it solves
- Proposed implementation
- Use cases

## 🔧 Development Setup

### Prerequisites

- Neovim >= 0.9.0
- Git
- Make (optional but recommended)
- StyLua (for formatting)

### Getting Started

1. **Fork the repository**

```bash
git clone https://github.com/YOUR_USERNAME/nvim.git
cd nvim
```

2. **Install dependencies**

```bash
make install
# or manually:
brew install stylua luacheck
```

3. **Make your changes**

Follow the project structure and coding guidelines below.

4. **Test your changes**

```bash
# Test configuration loads
make test

# Format code
make format

# Run health check
make health
```

## 📁 Project Structure

```
nvim/
├── lua/
│   ├── config/          # Core configuration
│   │   ├── init.lua     # Initialization
│   │   ├── options.lua  # Vim options
│   │   ├── keymaps.lua  # Key mappings
│   │   ├── autocmds.lua # Auto commands
│   │   ├── theme.lua    # Theme management
│   │   └── health.lua   # Health checks
│   ├── plugins/         # Plugin configurations
│   │   ├── ui/          # UI plugins
│   │   ├── editor/      # Editor enhancements
│   │   ├── lsp/         # LSP plugins
│   │   ├── git/         # Git integrations
│   │   ├── terminal/    # Terminal plugins
│   │   ├── completion/  # Completion plugins
│   │   └── debug/       # Debug plugins
│   └── util/            # Utility functions
├── .github/             # GitHub templates and workflows
├── README.md            # Main documentation
├── KEYBINDINGS.md       # Keybinding reference
├── CHANGELOG.md         # Version history
├── Makefile             # Task automation
└── install.sh           # Installation script
```

## 🎨 Coding Guidelines

### Lua Style

- Follow the existing code style
- Use tabs for indentation (configured in `.stylua.toml`)
- Use meaningful variable names
- Add comments for complex logic
- Run `make format` before committing

### Plugin Configuration

When adding a new plugin:

1. **Choose the right category** directory (`ui/`, `editor/`, `lsp/`, etc.)
2. **Create a descriptive filename** (e.g., `plugin-name.lua`)
3. **Use lazy loading** when possible
4. **Document the plugin** with a comment at the top:

```lua
-- Brief description of what the plugin does
-- see: https://github.com/author/plugin-name

return {
	"author/plugin-name",
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("plugin-name").setup({
			-- configuration
		})
	end,
}
```

5. **Test thoroughly** with both themes
6. **Update documentation** if it adds new keybindings

### Keybindings

- Use `<leader>` for custom commands (spacebar by default)
- Check for conflicts with existing keybindings
- Document new keybindings in `KEYBINDINGS.md`
- Use descriptive names in WhichKey integration

### Themes

When adding a new theme:

1. Create theme file in `lua/plugins/ui/`
2. Update `lua/config/theme.lua` to include it
3. Test theme switching with `<leader>tt`
4. Ensure lualine integrates properly

## 📝 Documentation

- Update `README.md` for significant changes
- Update `KEYBINDINGS.md` for new keybindings
- Update `CHANGELOG.md` following [Keep a Changelog](https://keepachangelog.com/)
- Update plugin README if adding/removing plugins

## ✅ Pull Request Process

1. **Create a feature branch**

```bash
git checkout -b feature/your-feature-name
```

2. **Make your changes**

- Follow coding guidelines
- Keep commits atomic and descriptive
- Write meaningful commit messages

3. **Test your changes**

```bash
make test
make format
make health
```

4. **Update documentation**

- README.md (if needed)
- KEYBINDINGS.md (for new keybindings)
- CHANGELOG.md (under `[Unreleased]`)
- Plugin README (if changing plugins)

5. **Push and create PR**

```bash
git push origin feature/your-feature-name
```

Then create a pull request on GitHub using the PR template.

6. **Address feedback**

- Respond to review comments
- Make requested changes
- Keep the PR up to date with main branch

## 🔍 Code Review

All submissions require review before merging. Reviewers will check:

- Code quality and style
- Functionality and testing
- Documentation updates
- Performance impact
- Compatibility with both themes

## 📜 Commit Message Guidelines

Use clear, descriptive commit messages:

```
<type>: <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat: add catppuccin theme support
fix: resolve lualine theme switching issue
docs: update keybindings for telescope
chore: update plugin dependencies
```

## 🎓 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Learn Lua in Y minutes](https://learnxinyminutes.com/docs/lua/)
- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html)

## 💬 Getting Help

- Check the [README](README.md) and [KEYBINDINGS](KEYBINDINGS.md)
- Run `:checkhealth` in Neovim
- Search existing issues
- Create a new issue with the appropriate template

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project (see [LICENSE](.github/LICENSE)).

## 🙏 Thank You!

Your contributions make this project better for everyone. Thank you for taking the time to contribute!

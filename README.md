# 🚀 nvim

> A modern, organized, and feature-rich Neovim configuration built for productivity

This is my personal configuration for [Neovim](https://neovim.io/), designed to provide a powerful yet maintainable development environment.

## ✨ Features

- 🎨 **Dual Theme Support** - Switch between Nord and Gruvbox themes on the fly
- 📦 **Organized Plugin Structure** - Plugins categorized by functionality (UI, LSP, Git, etc.)
- ⚡ **Lazy Loading** - Fast startup times with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🔧 **LSP Ready** - Complete LSP setup with Mason, formatters, and linters
- 🌲 **Git Integration** - LazyGit, Fugitive, and GitSigns for seamless Git workflows
- 🤖 **AI Copilot** - GitHub Copilot integration for AI-assisted coding
- 🔍 **Telescope** - Powerful fuzzy finder for files, text, and more
- 🐛 **DAP Support** - Debug Adapter Protocol for debugging
- 📝 **Auto-formatting** - Format on save with language-specific formatters

## 🎯 Why This Config?

I built this configuration as part of my [_personal development environment_](https://www.youtube.com/watch?v=IK_-C0GXfjo). It's a completely personalized workspace tailored to my workflow, avoiding the bloat of VS Code or JetBrains IDEs while maintaining professional-grade features.

## 📋 Prerequisites

- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- **Node.js** (for LSP servers)
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## 🚀 Quick Start

### Option 1: Automated Installation (Recommended)

The easiest way to install is using the automated installation script.

**Supported platforms:** macOS (Homebrew), Debian/Ubuntu (apt)

```bash
# Clone the repository
git clone https://github.com/dotbrains/nvim ~/.config/nvim

# Run the installer
cd ~/.config/nvim
./install.sh
```

The script will:
- ✅ Detect your operating system
- ✅ Check and install Neovim (if needed)
- ✅ Install all dependencies (via Homebrew or apt)
- ✅ Backup your existing configuration
- ✅ Install lazy.nvim
- ✅ Install all plugins automatically

### Option 2: Manual Installation

#### 1. Install Neovim

Using Homebrew (macOS):

```bash
brew install nvim
```

#### 2. Install Dependencies

```bash
brew install \
    lazygit \
    lua-language-server \
    efm-langserver \
    ripgrep \
    fd \
    code-minimap \
    deno \
    stylua \
    google-java-format \
    prettier
```

#### 3. Install Configuration

**Backup your existing config** (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

**Clone this repository:**

```bash
git clone https://github.com/dotbrains/nvim ~/.config/nvim
```

#### 4. Launch Neovim

```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

### Post-Installation

After installation, run the health check:

```vim
:checkhealth
```

Or from the command line:

```bash
make health
```

## 🗂️ Project Structure

```
nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── autocmds.lua        # Auto commands
│   │   ├── globals.lua         # Global variables
│   │   ├── init.lua            # Config initialization
│   │   ├── keymaps.lua         # Key mappings
│   │   ├── options.lua         # Vim options
│   │   └── theme.lua           # Theme switching logic
│   ├── plugins/                # Plugin configurations
│   │   ├── ui/                 # UI & appearance plugins
│   │   ├── editor/             # Editor enhancements
│   │   ├── lsp/                # LSP & language tools
│   │   ├── git/                # Git integrations
│   │   ├── terminal/           # Terminal plugins
│   │   ├── completion/         # Completion & snippets
│   │   └── debug/              # Debugging tools
│   └── util/                   # Utility functions
└── .stylua.toml                # Stylua formatter config
```

## 🎨 Theme Switching

Switch between Nord and Gruvbox themes using:

```
<leader>tt
```

(By default, `<leader>` is the spacebar)

## ⌨️ Key Bindings

For a complete list of keybindings, see [KEYBINDINGS.md](KEYBINDINGS.md).

### Quick Reference

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>tt` | Toggle theme |
| Normal | `<leader>e` | Toggle file explorer |
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fg` | Live grep |
| Normal | `<leader>gg` | LazyGit |

## 🔧 Customization

### Adding a New Theme

1. Add the theme plugin to `lua/plugins/ui/`
2. Update `lua/config/theme.lua` to include the new theme in the `themes` table

### Modifying Keybindings

Edit `lua/config/keymaps.lua` to customize keybindings.

### Adding Plugins

Add new plugin configuration files to the appropriate directory under `lua/plugins/`.

## 🐳 Testing with Docker

You can test this configuration in a clean Ubuntu/Debian environment using Docker:

### Quick Test

```bash
# Ubuntu 22.04
docker run -it --rm ubuntu:22.04 bash -c "
  apt-get update &&
  apt-get install -y git curl sudo &&
  git clone https://github.com/dotbrains/nvim /root/.config/nvim &&
  cd /root/.config/nvim &&
  ./install.sh
"

# Debian 12
docker run -it --rm debian:12 bash -c "
  apt-get update &&
  apt-get install -y git curl sudo &&
  git clone https://github.com/dotbrains/nvim /root/.config/nvim &&
  cd /root/.config/nvim &&
  ./install.sh
"
```

### Interactive Testing

```bash
# Start a container
docker run -it --rm ubuntu:22.04 bash

# Inside the container
apt-get update
apt-get install -y git curl sudo
git clone https://github.com/dotbrains/nvim /root/.config/nvim
cd /root/.config/nvim
./install.sh

# Test nvim
nvim
```

### Create a Dockerfile for Development

Create a `Dockerfile.test` for persistent testing:

```dockerfile
FROM ubuntu:22.04

# Install base dependencies
RUN apt-get update && \
    apt-get install -y git curl sudo && \
    rm -rf /var/lib/apt/lists/*

# Clone configuration
RUN git clone https://github.com/dotbrains/nvim /root/.config/nvim

# Run installer
WORKDIR /root/.config/nvim
RUN ./install.sh

# Set working directory
WORKDIR /root

CMD ["nvim"]
```

Build and run:

```bash
# Build image
docker build -f Dockerfile.test -t nvim-test .

# Run container
docker run -it --rm nvim-test
```

## 🛠️ Maintenance

### Using Make Commands

This configuration includes a Makefile for common tasks:

```bash
make help      # Show all available commands
make update    # Update all plugins
make clean     # Clean cache and temporary files
make format    # Format Lua files with stylua
make lint      # Lint Lua files
make health    # Run health check
make check     # Run all checks (format + lint + health)
make backup    # Backup current configuration
make restore   # Restore from latest backup
make test      # Test configuration loads
```

### Using Neovim Commands

#### Update Plugins

```vim
:Lazy update
```

#### Check Plugin Status

```vim
:Lazy
```

#### Check LSP Status

```vim
:LspInfo
```

#### Format Code

Code is automatically formatted on save. To manually format:

```vim
:lua vim.lsp.buf.format()
```

#### Run Health Check

```vim
:checkhealth
```

## 🤝 Contributing

This is a personal configuration, but feel free to fork it and make it your own!

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to report bugs
- How to suggest features
- Development setup
- Coding guidelines
- Pull request process

If you find bugs or have suggestions, please [open an issue](https://github.com/dotbrains/nvim/issues).

## 📝 License

This project is licensed under the terms found in [LICENSE](LICENSE).

## 🙏 Acknowledgments

Built with inspiration from the Neovim community and various dotfile configurations.

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

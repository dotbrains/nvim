#!/usr/bin/env bash

# Neovim Configuration Installation Script
# This script automates the setup process for this Neovim configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NVIM_CONFIG_DIR="${HOME}/.config/nvim"
BACKUP_DIR="${HOME}/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"

# Print colored output
print_info() {
    echo -e "${BLUE}ℹ ${NC}$1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ -f /etc/debian_version ]]; then
        OS="debian"
    elif [[ -f /etc/redhat-release ]]; then
        OS="redhat"
    else
        OS="unknown"
    fi
}

# Check package manager
check_package_manager() {
    if [[ "$OS" == "macos" ]]; then
        if ! command_exists brew; then
            print_error "Homebrew is not installed"
            print_info "Install Homebrew from https://brew.sh"
            exit 1
        fi
        print_success "Homebrew is installed"
    elif [[ "$OS" == "debian" ]]; then
        if ! command_exists apt-get; then
            print_error "apt-get not found"
            exit 1
        fi
        print_success "apt package manager available"
    fi
}

# Check Neovim installation
check_neovim() {
    print_info "Checking Neovim installation..."
    
    if ! command_exists nvim; then
        print_warning "Neovim is not installed"
        
        if [[ "$OS" == "macos" ]]; then
            read -p "Install Neovim via Homebrew? (y/n) " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                brew install neovim
                print_success "Neovim installed"
            else
                print_error "Neovim is required. Exiting."
                exit 1
            fi
        elif [[ "$OS" == "debian" ]]; then
            read -p "Install Neovim? (y/n) " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                print_info "Adding Neovim PPA..."
                sudo apt-get update
                sudo apt-get install -y software-properties-common
                sudo add-apt-repository -y ppa:neovim-ppa/unstable
                sudo apt-get update
                sudo apt-get install -y neovim
                print_success "Neovim installed"
            else
                print_error "Neovim is required. Exiting."
                exit 1
            fi
        else
            print_error "Please install Neovim manually: https://neovim.io"
            exit 1
        fi
    else
        print_success "Neovim is installed"
    fi
}

# Install dependencies
install_dependencies() {
    print_info "Checking dependencies..."
    
    if [[ "$OS" == "macos" ]]; then
        install_dependencies_macos
    elif [[ "$OS" == "debian" ]]; then
        install_dependencies_debian
    else
        print_warning "Unsupported OS for automatic dependency installation"
        print_info "See README.md for manual installation instructions"
    fi
}

# Install dependencies on macOS
install_dependencies_macos() {
    local deps=(
        "lazygit"
        "lua-language-server"
        "efm-langserver"
        "ripgrep"
        "fd"
        "code-minimap"
        "deno"
        "stylua"
        "prettier"
    )
    
    local missing_deps=()
    
    for dep in "${deps[@]}"; do
        if ! command_exists "$dep"; then
            missing_deps+=("$dep")
        fi
    done
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        print_success "All dependencies are installed"
        return
    fi
    
    print_warning "Missing dependencies: ${missing_deps[*]}"
    
    read -p "Install missing dependencies via Homebrew? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew install "${missing_deps[@]}"
        print_success "Dependencies installed"
    else
        print_warning "Some features may not work without all dependencies"
    fi
}

# Install dependencies on Debian/Ubuntu
install_dependencies_debian() {
    local missing_count=0
    
    # Check core dependencies
    if ! command_exists rg; then
        ((missing_count++))
    fi
    if ! command_exists fd; then
        ((missing_count++))
    fi
    if ! command_exists node; then
        ((missing_count++))
    fi
    
    if [ $missing_count -eq 0 ]; then
        # Check optional tools
        local all_installed=true
        command_exists lazygit || all_installed=false
        command_exists lua-language-server || all_installed=false
        command_exists stylua || all_installed=false
        command_exists prettier || all_installed=false
        command_exists deno || all_installed=false
        
        if $all_installed; then
            print_success "All dependencies are installed"
            return
        fi
    fi
    
    print_warning "Some dependencies are missing"
    read -p "Install available dependencies? (y/n) " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Some features may not work without all dependencies"
        return
    fi
    
    print_info "Installing dependencies..."
    sudo apt-get update
    
    # Install core dependencies
    if ! command_exists rg; then
        sudo apt-get install -y ripgrep
    fi
    
    if ! command_exists fd; then
        sudo apt-get install -y fd-find
        # Create symlink if fd-find was installed
        if command_exists fdfind && ! command_exists fd; then
            sudo ln -s $(which fdfind) /usr/local/bin/fd 2>/dev/null || true
        fi
    fi
    
    if ! command_exists node; then
        print_info "Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
    
    # Install npm packages
    if command_exists npm; then
        if ! command_exists prettier; then
            sudo npm install -g prettier
        fi
    fi
    
    # Install lazygit
    if ! command_exists lazygit; then
        print_info "Installing lazygit..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm lazygit.tar.gz lazygit
    fi
    
    # Install lua-language-server
    if ! command_exists lua-language-server; then
        print_info "Installing lua-language-server..."
        sudo apt-get install -y lua-language-server || print_warning "lua-language-server not available in repos"
    fi
    
    # Install stylua via cargo if available
    if ! command_exists stylua; then
        if command_exists cargo; then
            print_info "Installing stylua via cargo..."
            cargo install stylua
        else
            print_warning "stylua not installed (requires cargo/rust)"
            print_info "Install rust: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
        fi
    fi
    
    # Install deno
    if ! command_exists deno; then
        print_info "Installing deno..."
        curl -fsSL https://deno.land/install.sh | sh
        # Add deno to PATH for current session
        export DENO_INSTALL="$HOME/.deno"
        export PATH="$DENO_INSTALL/bin:$PATH"
    fi
    
    print_success "Core dependencies installed"
    print_info "Some optional tools may require manual installation"
}

# Backup existing configuration
backup_existing_config() {
    if [ -d "$NVIM_CONFIG_DIR" ]; then
        print_info "Backing up existing Neovim configuration..."
        mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
        print_success "Backup created at: $BACKUP_DIR"
    fi
}

# Clone or copy configuration
setup_config() {
    print_info "Setting up Neovim configuration..."
    
    # If running from within the repo, create symlink
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    if [ -f "$SCRIPT_DIR/init.lua" ]; then
        print_info "Installing from local directory..."
        cp -r "$SCRIPT_DIR" "$NVIM_CONFIG_DIR"
        print_success "Configuration installed"
    else
        print_error "Could not find configuration files"
        exit 1
    fi
}

# Install lazy.nvim
install_lazy() {
    local LAZY_PATH="${HOME}/.local/share/nvim/lazy/lazy.nvim"
    
    if [ ! -d "$LAZY_PATH" ]; then
        print_info "Installing lazy.nvim..."
        git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH"
        print_success "lazy.nvim installed"
    else
        print_success "lazy.nvim already installed"
    fi
}

# Install plugins
install_plugins() {
    print_info "Installing plugins..."
    print_info "This may take a few minutes..."
    
    nvim --headless "+Lazy! sync" +qa
    
    print_success "Plugins installed"
}

# Main installation flow
main() {
    echo ""
    echo "╔═══════════════════════════════════════╗"
    echo "║   Neovim Configuration Installer      ║"
    echo "╚═══════════════════════════════════════╝"
    echo ""
    
    print_info "Starting installation..."
    echo ""
    
    # Check prerequisites
    detect_os
    print_info "Detected OS: $OS"
    check_package_manager
    check_neovim
    
    # Install dependencies
    install_dependencies
    echo ""
    
    # Backup and setup
    backup_existing_config
    setup_config
    echo ""
    
    # Install lazy.nvim and plugins
    install_lazy
    install_plugins
    echo ""
    
    # Success message
    echo "╔═══════════════════════════════════════╗"
    echo "║      Installation Complete! 🎉        ║"
    echo "╚═══════════════════════════════════════╝"
    echo ""
    print_success "Neovim configuration installed successfully"
    echo ""
    print_info "Next steps:"
    echo "  1. Launch Neovim: nvim"
    echo "  2. Run health check: :checkhealth"
    echo "  3. Read the documentation: :help"
    echo "  4. Toggle theme: <leader>tt"
    echo ""
    print_info "See README.md and KEYBINDINGS.md for more information"
    echo ""
}

# Run installation
main

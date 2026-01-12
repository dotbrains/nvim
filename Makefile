.PHONY: help install update clean format lint health check test backup restore

# Default target
help:
	@echo "Neovim Configuration - Available Commands"
	@echo "=========================================="
	@echo ""
	@echo "  make install    - Install configuration and dependencies"
	@echo "  make update     - Update all plugins"
	@echo "  make clean      - Clean plugin cache and lock files"
	@echo "  make format     - Format Lua files with stylua"
	@echo "  make lint       - Lint Lua files"
	@echo "  make health     - Run health check"
	@echo "  make check      - Run all checks (format + lint + health)"
	@echo "  make backup     - Backup current configuration"
	@echo "  make restore    - Restore from latest backup"
	@echo "  make test       - Test configuration loads without errors"
	@echo ""

# Install configuration
install:
	@echo "Installing Neovim configuration..."
	@bash install.sh

# Update plugins
update:
	@echo "Updating plugins..."
	@nvim --headless "+Lazy! sync" +qa
	@echo "Plugins updated successfully!"

# Clean cache and temporary files
clean:
	@echo "Cleaning cache and temporary files..."
	@rm -rf ~/.local/share/nvim/lazy
	@rm -rf ~/.local/state/nvim
	@rm -rf ~/.cache/nvim
	@echo "Cache cleaned!"

# Format Lua files with stylua
format:
	@if command -v stylua >/dev/null 2>&1; then \
		echo "Formatting Lua files..."; \
		stylua lua/ --config-path .stylua.toml; \
		echo "Files formatted!"; \
	else \
		echo "Error: stylua is not installed"; \
		echo "Install with: brew install stylua"; \
		exit 1; \
	fi

# Lint Lua files
lint:
	@if command -v luacheck >/dev/null 2>&1; then \
		echo "Linting Lua files..."; \
		luacheck lua/; \
	else \
		echo "Warning: luacheck is not installed"; \
		echo "Install with: brew install luacheck"; \
		echo "Skipping lint..."; \
	fi

# Run health check
health:
	@echo "Running health check..."
	@nvim --headless -c "lua require('config.health').check()" -c "qa"
	@echo ""
	@echo "For detailed plugin health, run: nvim +checkhealth"

# Run all checks
check: format lint health
	@echo "All checks complete!"

# Test configuration
test:
	@echo "Testing configuration..."
	@nvim --headless -c "lua print('Configuration loaded successfully')" -c "qa"
	@echo "Configuration test passed!"

# Backup configuration
backup:
	@echo "Creating backup..."
	@BACKUP_DIR="$$HOME/.config/nvim.backup.$$(date +%Y%m%d_%H%M%S)"; \
	cp -r ~/.config/nvim "$$BACKUP_DIR"; \
	echo "Backup created at: $$BACKUP_DIR"

# Restore from latest backup
restore:
	@echo "Restoring from latest backup..."
	@LATEST_BACKUP=$$(ls -dt ~/.config/nvim.backup.* 2>/dev/null | head -1); \
	if [ -n "$$LATEST_BACKUP" ]; then \
		rm -rf ~/.config/nvim; \
		cp -r "$$LATEST_BACKUP" ~/.config/nvim; \
		echo "Restored from: $$LATEST_BACKUP"; \
	else \
		echo "No backups found!"; \
		exit 1; \
	fi

# Show version info
info:
	@echo "Neovim Configuration Info"
	@echo "========================"
	@echo ""
	@nvim --version | head -1
	@echo "Config location: ~/.config/nvim"
	@echo "Data location: ~/.local/share/nvim"
	@echo ""
	@echo "Themes: Nord (default), Gruvbox"
	@echo "Plugin manager: lazy.nvim"
	@echo ""

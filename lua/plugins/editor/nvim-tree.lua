-- A file explorer tree for neovim written in lua.
-- see: https://github.com/nvim-tree/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  requires = { "nvim-tree/nvim-web-devicons" }, -- Optional: for file icons
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
      },
      view = {
        adaptive_size = true,
        width = 30, -- Set the width of the tree view
        side = "left", -- Position of the tree view
      },
      git = {
        enable = true, -- Enable git integration
        ignore = false, -- Show ignored files
      },
      -- Other options can be added here
    }
  end,
}

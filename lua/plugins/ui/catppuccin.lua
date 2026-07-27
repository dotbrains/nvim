return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "macchiato",
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
      },
    }
  end,
}

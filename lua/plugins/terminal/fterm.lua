-- 🔥 No-nonsense floating terminal plugin for neovim 🔥
-- see: https://github.com/numToStr/FTerm.nvim

local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
  require("FTerm").setup {
    blend = 5,
    dimensions = {
      height = 0.90,
      width = 0.90,
      x = 0.5,
      y = 0.5,
    },
  }

  -- Autocommand to disable space when FTerm is opened
  vim.api.nvim_create_autocmd("User", {
    pattern = "FTermOpen",
    callback = function()
      vim.api.nvim_set_keymap("n", "<leader>", "<nop>", { noremap = true, silent = true })
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "FTermClose",
    callback = function()
      vim.api.nvim_set_keymap("n", "<leader>", " ", { noremap = true, silent = true })
    end,
  })
end

local opts = {
  noremap = true,
  silent = true,
}

return {
  "numToStr/FTerm.nvim",
  config = config,
  opts = opts,
  keys = {
    -- normal mode mappings
    mapvimkey("<leader>t", "lua require('FTerm').toggle()"),
  },
}

-- NvChad's Official Terminal Plugin.
-- see: https://github.com/NvChad/nvterm

return {
  "NvChad/nvterm",
  lazy = false,
  config = function()
    require("nvterm").setup()

    local terminal = require "nvterm.terminal"

    local toggle_modes = { "n", "t" }
    local mappings = {
      {
        toggle_modes,
        "<leader>h",
        function()
          terminal.toggle "horizontal"
        end,
      },
      {
        toggle_modes,
        "<leader>v",
        function()
          terminal.toggle "vertical"
        end,
      },
      {
        toggle_modes,
        "<leader>i",
        function()
          terminal.toggle "float"
        end,
      },
    }

    local opts = { noremap = true, silent = true }
    for _, mapping in ipairs(mappings) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end

    -- Autocommand to disable space when NvTerm is opened
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvTermOpen",
      callback = function()
        vim.api.nvim_set_keymap("n", "<leader>", "<nop>", { noremap = true, silent = true })
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvTermClose",
      callback = function()
        vim.api.nvim_set_keymap("n", "<leader>", " ", { noremap = true, silent = true })
      end,
    })
  end,
}

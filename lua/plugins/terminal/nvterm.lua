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

    -- Function to disable space as leader key
    local function disable_space_leader()
      vim.api.nvim_set_keymap("n", "<leader>", "<nop>", { noremap = true, silent = true })
    end

    -- Function to restore space as leader key
    local function restore_space_leader()
      vim.api.nvim_set_keymap("n", "<leader>", " ", { noremap = true, silent = true })
    end

    -- Autocommand to disable space when NvTerm is opened
    vim.cmd [[
          augroup NvTermKeymap
            autocmd!
            autocmd User NvTermOpen lua disable_space_leader()
            autocmd User NvTermClose lua restore_space_leader()
          augroup END
        ]]
  end,
}

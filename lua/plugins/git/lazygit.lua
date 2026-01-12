-- LazyGit in nvim
-- see: https://github.com/kdheepak/lazygit.nvim

return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>lg",
      "<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>",
      desc = "LazyGit",
    },
  },
  config = function()
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_border_chars = {
      "╭",
      "─",
      "╮",
      "│",
      "╯",
      "─",
      "╰",
      "│",
    }
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_use_neovim_remote = 1
    vim.g.lazygit_use_custom_config_file_path = 0
    vim.g.lazygit_config_file_path = {}

    -- Function to disable space as leader key
    local function disable_space_leader()
      vim.api.nvim_set_keymap("n", "<leader>", "<nop>", { noremap = true, silent = true })
    end

    -- Function to restore space as leader key
    local function restore_space_leader()
      vim.api.nvim_set_keymap("n", "<leader>", " ", { noremap = true, silent = true })
    end

    -- Autocommand to disable space when LazyGit is opened
    vim.cmd [[
        augroup LazyGitKeymap
          autocmd!
          autocmd User LazyGitOpen lua disable_space_leader()
          autocmd User LazyGitClose lua restore_space_leader()
        augroup END
      ]]
  end,
}

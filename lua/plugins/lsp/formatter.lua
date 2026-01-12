-- Format on save in nvim
-- see: https://github.com/mhartington/formatter.nvim

return {
    'mhartington/formatter.nvim',
    event = 'BufWritePost',
    config = function()
        require('formatter').setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    -- luafmt
                    function()
                        return {
                            exe = "stylua",
                            args = {"--indent-count", 2, "--stdin"},
                            stdin = true
                        }
                    end
                },
                python = {
                    -- black
                    function()
                        return {
                            exe = "black",
                            args = {"-"},
                            stdin = true
                        }
                    end
                },
                java = {
                    -- google-java-format
                    function()
                        return {
                            exe = "google-java-format",
                            args = {"-"},
                            stdin = true
                        }
                    end
                },
                html = {
                    -- prettier
                    function()
                        return {
                            exe = "prettier",
                            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                },
                css = {
                    -- prettier
                    function()
                        return {
                            exe = "prettier",
                            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                },
                javascript = {
                    -- prettier
                    function()
                        return {
                            exe = "prettier",
                            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                            stdin = true
                        }
                    end
                }
            }
        })
    end
}

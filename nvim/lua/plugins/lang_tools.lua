return {
    {
        'Vimjas/vim-python-pep8-indent'
    },
    -- autopairs
    {
        'windwp/nvim-autopairs',
        config = function ()
            local autopairs = require('nvim-autopairs')
            autopairs.setup({
                enable_check_bracket_line = false,
                check_ts = true,
                ts_config = {
                    lua = {'string'},
                }
            })
        end
    },
    -- nvim comment
    {
        'terrortylor/nvim-comment',
        config = function ()
            require('nvim_comment').setup()
        end
    },
    -- neogen - annotations
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    -- neopeek - markdown preview
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        config = function ()
            local peek = require('peek')
            peek.setup({
                app = 'browser'
            })

            vim.api.nvim_create_user_command('PeekOpen', peek.open, {})
            vim.api.nvim_create_user_command('PeekClose', peek.close, {})
        end
    },
    {
        "peterhoeg/vim-qml",
        event = "BufRead",
        ft = { "qml" },
    },
}

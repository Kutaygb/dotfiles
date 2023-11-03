return {
    {
        'catppuccin/nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'williamboman/mason.nvim',
            'hrsh7th/nvim-cmp',
            'lewis6991/gitsigns.nvim',
            'SmiteshP/nvim-navic',
            'lukas-reineke/indent-blankline.nvim',
        },
        name = 'catppuccin',
        config = function ()
            local catppuccin = require('catppuccin')

            catppuccin.setup({
                flavour = "mocha",
                dim_inactive = {enabled = true},
                integrations = {
                    neotree = true,
                    treesitter = true,
                    mason = true,
                    gitsigns = true,
                    cmp = true,
                    navic = {
                        enabled = true,
                        custom_bg = "NONE",
                    },
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },
                }
            })

            vim.cmd.colorscheme "catppuccin"
        end
    },
}

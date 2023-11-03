local utils = require('core.utils')

return {
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'SmiteshP/nvim-navic',
        },
        config = function ()
            local lualine = require('lualine')
            local navic = require("nvim-navic")

            local get_navic = function ()
                if navic.is_available() then
                    return navic.get_location()
                end
            end

            local count_windows = function ()
                local cur_tab = vim.api.nvim_get_current_tabpage()
                local tablist = vim.api.nvim_tabpage_list_wins(cur_tab)
                if tablist[2] then return true end
            end

            lualine.setup({
                options = {
                    theme = 'catppuccin',
                    always_divide_middle = true,
                },
                sections = {
                    lualine_c = {'filename', get_navic}
                },
                inactive_sections = {
                    lualine_a = {'filename'},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_z = {'location'}
                },
                tabline = {
                    lualine_a = {{'tabs', mode=2}},
                    lualine_z = {'searchcount'},
                    lualine_y = {{'windows', cond=count_windows}},
                },
            })
            
        end
    },
    -- diffview
    {
        'sindrets/diffview.nvim',
        config = function ()
            local diffview = require('diffview')

            diffview.setup{}

            utils.keymap{key='<leader>GD', command=':DiffviewOpen<CR>', desc='[Diffview] open'}
            utils.keymap{key='<leader>GC', command=':DiffviewClose<CR>', desc='[Diffview] close'}
            utils.keymap{key='<leader>GR', command=':DiffviewRefresh<CR>', desc='[Diffview] refresh'}
            utils.keymap{key='<leader>GF', command=':DiffviewFileHistory<CR>', desc='[Diffview] file history'}
        end
    },
    -- gitsigns
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            local gitsigns = require('gitsigns')

            gitsigns.setup({
                numhl = true,
            })

            utils.keymap{key='<leader>gp', command=':Gitsigns preview_hunk', desc="[Gitsigns] toggle word diff"}
            utils.keymap{key='<leader>gw', command=':Gitsigns toggle_word_diff<CR>', desc="[Gitsigns] toggle word diff"}
            utils.keymap{key='<leader>gb', command=':Gitsigns toggle_current_line_blame<CR>', desc="[Gitsigns] toggle current line blame"}
        end
    },
    -- indent blankline
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            local indent_blankline = require('ibl')

            vim.opt.list = true
            -- vim.opt.listchars:append("eol:↴")

            indent_blankline.setup {
                scope = {enabled=true}
              -- show_current_context = true,
              -- show_current_context_start = true,
              -- show_end_of_line = true,
              -- char_highlight_list = {
              --       "IndentBlanklineIndent1",
              --       "IndentBlanklineIndent2",
              --       "IndentBlanklineIndent3",
              --       "IndentBlanklineIndent4",
              --       "IndentBlanklineIndent5",
              --       "IndentBlanklineIndent6",
              --   },
            }
        end
    },
    -- whichkey
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            require("which-key").setup({})
        end,
    },
    -- colorizer
    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        config = true,
    },
}

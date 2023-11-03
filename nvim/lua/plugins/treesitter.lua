return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
            'p00f/nvim-ts-rainbow',
            'folke/twilight.nvim',
            'folke/todo-comments.nvim',
            'lukas-reineke/indent-blankline.nvim',
        },
        config = function ()
            local configs = require('nvim-treesitter.configs')

            configs.setup {
                ensure_installed = { 'c', 'lua', 'python', 'rust', 'go' },
                sunc_install = false,
                auto_install = true,

                indent = {
                    enable = true,
                    disable = { 'python' }
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<c-backspace>',
                    },
                },

                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            [']m'] = '@function.outer',
                            [']]'] = '@block.outer',
                        },
                        goto_next_end = {
                            [']M'] = '@function.outer',
                            [']['] = '@block.outer',
                        },
                        goto_previous_start = {
                            ['[m'] = '@function.outer',
                            ['[['] = '@block.outer',
                        },
                        goto_previous_end = {
                            ['[M'] = '@function.outer',
                            ['[]'] = '@block.outer',
                        },
                    },
                    lsp_interop = {
                        enable = true,
                        border = 'none',
                        floating_preview_opts = {},
                        peek_definition_code = {
                            ["<leader>df"] = "@block.outer",
                        },
                    },
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>k'] = '@parameter.inner',
                        },
                        swap_previous = {
                            ['<leader>j'] = '@parameter.inner',
                        },
                    },
                },

                rainbow = {
                    enable = true,
                    extended_mode = true,
                },

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                }
            }

            require 'treesitter-context'.setup()
            require 'twilight'.setup({
                context = 10, -- amount of lines we will try to show around the current line
                treesitter = true, -- use treesitter when available for the filetype
                expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
                    "function",
                    "method",
                    "table",
                    "if_statement",
                },
            })
            require('core.utils').keymap{key='<leader>T', command=':Twilight<CR>', desc='[Twilight] toggle'}

            require("todo-comments").setup {}
        end
    },
}

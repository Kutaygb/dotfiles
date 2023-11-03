return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch='v2.x',
        dependencies = {
            's1n7ax/nvim-window-picker',
            'nvim-tree/nvim-web-devicons',
        },
        config = function ()
            local utils = require('core.utils')

            local wpicker = require('window-picker')

            wpicker.setup({
                autoselect_one = true,
                include_current = false,
                selection_chars = '123456789',
                -- use_winbar = 'smart',
                -- filter_rules = {
                --     bo = {
                --         filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                --         buftype = { 'terminal', "quickfix" },
                --     },
                -- },
                -- other_win_hl_color = '#e35e4f',
            })

            local neotree = require('neo-tree')

            neotree.setup({
                close_if_last_window = true,
                enable_git_status = true,
                enable_diagnostics = true,
                indent_size = 2,

                window = {
                    mapping_options = {
                        noremap = false,
                        nowait = true,
                    },

                    mappings = {
                        ["<space>"] = {
                            "toggle_node",
                        },
                        ["<2-LeftMouse>"] = "open_with_window_picker",
                        ["<cr>"] = "open_with_window_picker",
                        ["o"] = "open_with_window_picker",
                        ["O"] = function(state)
                            state.commands["open_with_window_picker"](state)
                            vim.cmd("Neotree reveal")
                        end,
                        ["s"] = "split_with_window_picker",
                        ["v"] = "vsplit_with_window_picker",
                        ["t"] = "open_tabnew",
                        ["C"] = "close_node",
                        ["a"] = {
                            "add",
                            config = {
                                show_path = "relative"
                            }
                        },
                        ["A"] = "add_directory",
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy",
                        ["m"] = "move",
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                    }
                },
            })

            utils.keymap{key='<leader><leader>', command=':NeoTreeFloatToggle<CR>', desc='[Neotree] Toggle float'}
            utils.keymap{key='||', command=':NeoTreeShowToggle<CR>', desc='[Neotree] Toggle panel'}
        end
    },
}

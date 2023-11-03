return {
    {
        'nvim-telescope/telescope.nvim',
        tag='0.1.4',
        dependencies = {
            'debugloop/telescope-undo.nvim',
        },
        config = function ()
            local utils = require('core.utils')

            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup({
                defaults ={
                    mappings = {
                        i = {
                            ['<C-s>'] = actions.select_horizontal,
                            ['<C-x>'] = nil,
                        }
                    }
                }
            })

            telescope.load_extension('undo')

            local builtin = require('telescope.builtin')

            utils.keymap{key='ff', command=builtin.find_files, desc='[Telescope] find files'}
            utils.keymap{key='fl', command=builtin.live_grep, desc='[Telescope] live grep'}
            utils.keymap{key='fb', command=builtin.buffers, desc='[Telescope] list buffers'}
            utils.keymap{key='fd', command=builtin.diagnostics, desc='[Telescope] list diagnostic outputs'}
            utils.keymap{key='ft', command=builtin.lsp_document_symbols, desc='[Telescope] list lsp symbols'}
            utils.keymap{key='fr', command=builtin.lsp_references, desc='[Telescope] list references'}
            utils.keymap{key='fg', command=builtin.git_files, desc='[Telescope] git files'}
            utils.keymap{key='fc', command=builtin.git_bcommits, desc='[Telescope] git commits for buffer'}
            utils.keymap{key='fC', command=builtin.git_commits, desc='[Telescope] git commits for project'}
            utils.keymap{key='fs', command=builtin.git_status, desc='[Telescope] git status'}
            utils.keymap{key='fS', command=builtin.git_stash, desc='[Telescope] git stash'}
            utils.keymap{key='fk', command=builtin.keymaps, desc='[Telescope] list keymaps'}
            utils.keymap{key='fh', command=builtin.help_tags, desc='[Telescope] list help tags'}
            utils.keymap{key='fu', command=telescope.extensions.undo.undo, desc='[Telescope] undo tree'}
            utils.keymap{key='fT', command=':TodoTelescope<CR>', desc='[Telescope] TODO'}
        end
    },
}

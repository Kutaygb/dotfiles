return {
    {
        'akinsho/toggleterm.nvim',
        config = function ()
            local utils = require('core.utils')

            local toggleterm = require('toggleterm')

            toggleterm.setup({
                open_mapping = [[<c-\>]],
                shade_terminals = false,
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,
                direction = 'float',
            })


            utils.keymap{mode='t', key='<Esc>', command='<C-\\><C-n>'}
            utils.keymap{key='<leader>tr', command=':ToggleTerm direction=horizontal<CR>', desc="[ToggleTerm] to restore"}
            utils.keymap{key='<leader>tt', command=':ToggleTerm direction=tab<CR>', desc="[ToggleTerm] to tab"}
        end
    }
}

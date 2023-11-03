return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'jayp0521/mason-nvim-dap.nvim',
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap-python',
        },
        config = function ()
            local utils = require('core.utils')

            local mason_dap = require('mason-nvim-dap')
            local dap = require("dap")
            local dapui = require("dapui")

            require('dap-python').setup('python')
            mason_dap.setup({
                ensure_installed = {'stylua', 'debugpy'},
                automatic_setup = {
                    configurations = {
                        python = {
                            utils.create_python_dap('Django', vim.fn.getcwd() .. '/manage.py', {'runserver', '--noreload', '0.0.0.0:8000'}),
                        },
                    },
                },
            })

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            -- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end


            utils.keymap{key='<leader>dc', command=dap.continue, desc="[DAP] Start Debugger"}
            utils.keymap{key='<leader>dt', command=dap.terminate, desc="[DAP] Teminate Debugger"}
            utils.keymap{key='<leader>dr', command=dap.restart, desc="[DAP] Restart Debugger"}
            utils.keymap{key='<leader>db', command=dap.toggle_breakpoint, desc="[DAP] Toggle breakpoint"}
            utils.keymap{key='<leader>du', command=dapui.toggle, desc="[DAP] Toggle Dap UI"}
        end,
    },
}

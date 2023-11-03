return {
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
            'jay-babu/mason-null-ls.nvim',
        },
        config = function ()
            local null_ls = require('null-ls')
            local mason_nullls = require('mason-null-ls')

            mason_nullls.setup({
                ensure_installed = {'stylua', 'mypy'},
                automatic_installation = true,
                automatic_setup = true,
                handles = {
                    mypy = function()
                      null_ls.register(null_ls.builtins.diagnostics.mypy.with{command={'python', '-m', 'mypy'}})
                    end,
                }
            })
            null_ls.setup()

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    source = true,
                }
            })
        end
    },

}

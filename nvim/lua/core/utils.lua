local M = {}

-- This function creates vim keymaps
-- Args:
-- key: str = Keyboard shortcut as string. 
-- command: str/callable = action that happens when shortcut used.
-- desc: Optional[str] = Description of the keymap.
-- mode: Optional[str] = Vim mode for the keymap. Defaults to 'n'.
-- opts: Optional[table] = Additional options for the keymap.

--- @param item table
function M.keymap(item)
    item = item or {}
    if not item.mode then item.mode = 'n' end
    if not item.key then error('You should provide key parameter') end
    if not item.command then error('You should provice command parameter') end
    if not item.opts then item.opts = {} end
    if not item.desc then item.desc = nil end

    item.opts['noremap'] = item.opts.noremap or true
    item.opts['desc'] = item.desc
    vim.keymap.set(item.mode, item.key, item.command, item.opts)
end

--- @param name string
--- @param program string
--- @param args table
function M.create_python_dap(name, program, args)
    local venv = os.getenv('VIRTUAL_ENV')
    return {
        type = 'python',
        request = 'launch',
        name = name,
        program = program,
        args = args,
        pythonPath = venv and (venv .. '/bin/python') or 'python',
    }
end

return M



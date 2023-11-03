local utils = require('core.utils')

local maps = {
  -- Quick save and exit
    {'n', 'qq', ':q!<CR>', 'Quit'},
    {'n', 'qw', ':wq<CR>', 'Save and Quit'},
    {'n', '<leader>w', ':w<CR>', 'Save'},

    -- Quick movement
    {'n', '<C-h>', '<C-w>h', 'Move to the left window'},
    {'n', '<C-l>', '<C-w>l', 'Move to the right window'},
    {'n', '<C-j>', '<C-w>j', 'Move to the lower window'},
    {'n', '<C-k>', '<C-w>k', 'Move to the upper window'},
    {'n', '<C-Left>', '<C-w>h', 'Move to the left window'},
    {'n', '<C-Right>', '<C-w>l', 'Move to the right window'},
    {'n', '<C-Down>', '<C-w>j', 'Move to the lower window'},
    {'n', '<C-Up>', '<C-w>k', 'Move to the upper window'},

    -- Quick tab management
    {'n', '<C-s>h', ':tabp<CR>'},
    {'n', '<C-s>l', ':tabn<CR>'},
    {'n', '<C-s>j', ':tabl<CR>'},
    {'n', '<C-s>k', ':tabr<CR>'},
    {'n', '<C-s><Left>', ':tabp<CR>'},
    {'n', '<C-s><Right>', ':tabn<CR>'},
    {'n', '<C-s><Down>', ':tabl<CR>'},
    {'n', '<C-s><Up>', ':tabr<CR>'},

    -- Utils
    {'n', '<leader>/', ':noh<CR>', 'Clear search highlight'},
}

for _, i in pairs(maps) do
  utils.keymap{mode=i[1], key=i[2], command=i[3], desc=i[4]}
end

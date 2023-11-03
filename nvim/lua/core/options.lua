local options = {
    termguicolors = true,
    mouse = 'a',

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smarttab = true,

    smartindent = true,
    wrap = false,

    swapfile = false,
    backup = false,
 
    hlsearch = true,
    incsearch = true,

    ignorecase = true,
    smartcase = true,

    nu = true,
    relativenumber = true,

    scrolloff = 8,
    signcolumn = "yes",

    updatetime = 50,

    completeopt = 'menuone,noselect',
    clipboard = 'unnamedplus',
    inccommand = 'nosplit',
    splitright = true,
    splitbelow = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.wo.signcolumn = 'yes'

vim.cmd "highlight CursorLineNR cterm=bold"



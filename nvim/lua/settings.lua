-- disable gui cursor styling, use default terminal cursor
vim.opt.guicursor = ""

-- enable line numbers
vim.opt.nu = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable relative line numbers
vim.opt.relativenumber = true

-- disable mouse usage
vim.opt.mouse = ""

-- set the number of spaces for a tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable smart indentation
vim.opt.smartindent = true

-- disable line wrapping
vim.opt.wrap = true

-- disable swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable search highlighting
vim.opt.hlsearch = false
-- enable incremental search
vim.opt.incsearch = true

-- enable true color support
vim.opt.termguicolors = true

-- keep 8 lines visible when scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- reduce update time for faster responsiveness
vim.opt.updatetime = 50

-- highlight the 80th column as a visual guide
-- vim.opt.colorcolumn = "80"


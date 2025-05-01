vim.g.mapleader = " "					-- sets leader key

-- netwr
vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=3				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw 
vim.g.netrw_listnumber=1				-- show line numbers in netwr
vim.g.netrw_keepdir = 0					-- keep the current directory
-- vim.cmd('set autochdir')				-- dir open is set as working dir
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- tabs
vim.opt.title = true					-- show title vim.opt.syntax = "ON"
vim.opt.titlestring = "%M"              -- show file name in title
vim.opt.showtabline = 1					-- always show the tab line
vim.opt.expandtab = false				-- expand tab 

-- disable mouse
vim.opt.mouse = ""

-- misc
vim.opt.scrolloff = 8                   -- keep 8 lines above and below cursor
vim.opt.backup = false                  -- disable backup
vim.opt.signcolumn = "yes"              -- show sign column
vim.opt.isfname:append("@-@")           -- allow @-@ in filenames
vim.opt.compatible = false				-- turn off vi compatibility mode
vim.opt.updatetime = 50					-- reduce update time (!= 4000) to faster reponsiveness

-- disable swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search and lines
vim.opt.number = true					-- turn on line numbers
vim.opt.relativenumber = true			-- turn on relative line numbers
vim.opt.ignorecase = true				-- enable case insensitive searching
vim.opt.smartcase = true				-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- indentation
vim.opt.wrap = true						-- enable text wrapping
vim.opt.tabstop = 4						-- tabs=4spaces
vim.opt.softtabstop = 4					-- spaces when pressing tab
vim.opt.shiftwidth = 4
vim.opt.expandtab = true			    -- convert tabs to spaces
vim.opt.pumheight = 10					-- number of items in popup menu
vim.opt.laststatus = 2					-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.smartindent = true

-- clipboard
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.completeopt= { "menuone", "noselect" }

-- splits
vim.opt.splitbelow = true				-- split go below
vim.opt.splitright = true				-- vertical split to the right

-- visual
vim.opt.termguicolors = true			-- terminal gui colors
vim.opt.guicursor = ""

-- proxy
-- vim.env.HTTP_PROXY = "http://proxy.dsi.scom:8080"
-- vim.env.HTTPS_PROXY = "http://proxy.dsi.scom:8080"
-- vim.env.http_proxy = "http://proxy.dsi.scom:8080"
-- vim.env.https_proxy = "http://proxy.dsi.scom:8080"

-- misc settings
vim.cmd [[
	set path+=**
	highlight Normal ctermbg=NONE guibg=NONE
	filetype plugin on
	set wildmenu
]]

-- set title to file name
function UpdateTitle()
    vim.opt.title = true
    vim.opt.titlestring = "%t"
end
vim.cmd("autocmd BufEnter * lua UpdateTitle()")


-- setup lazy.nvim

require('lazy').setup({
	checker = { enabled = true, notify = false },
	spec = {
		{ -- gcc to comment lines
			'tpope/vim-commentary'
		},
		{ -- render markdown
			'MeanderingProgrammer/render-markdown.nvim',
			dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }
		},
		{ -- fzf to find words and stuff
			'ibhagwan/fzf-lua',
			dependencies = { 'echasnovski/mini.icons' }
		},
		{ -- copilot plugin
			'CopilotC-Nvim/CopilotChat.nvim',
			dependencies = { { 'github/copilot.vim' }, { 'nvim-lua/plenary.nvim', branch = 'master' } }
		},
        {
            'catppuccin/nvim', 
            name = 'catppuccin', priority = 1000
        },
	},
})

-- fzf settings

require('fzf-lua').setup {
	winopts = { fullscreen = true  },
}

vim.api.nvim_set_keymap('n', '<leader>f', ':FzfLua files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', ':FzfLua grep_visual<CR>', { noremap = true, silent = true })

-- set fzf-lua as the default ui - used in CopilotChat
require('fzf-lua').register_ui_select()

-- CopilotChat settings

require('CopilotChat').setup {
	mappings = {
		complete = {
			insert = '<C-Right>'
		},
		close = {
			normal = '<C-c>',
			insert = 'nop'
		},
	},
}

-- vim.g.copilot_proxy = 'http://proxy.dsi.scom:8080'
vim.api.nvim_set_keymap('n', '<leader>c', ':CopilotChatToggle<CR>', { noremap = true, silent = true })

-- lsp settings
vim.lsp.enable('clangd')

-- theme settings

-- switch between light and dark theme
vim.g.light_theme = false
vim.cmd.colorscheme("default")

vim.keymap.set("n", "<leader>t", function()
  vim.g.light_theme = not vim.g.light_theme
  vim.cmd.colorscheme(vim.g.light_theme and "catppuccin-latte" or "default")
  vim.o.background = vim.g.light_theme and "light" or "dark"
end)


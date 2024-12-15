-- lazy vim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- plugin configuration
require("lazy").setup({
    checker = {enable = true},
    spec = {

        -- required plugins
        { 'nvim-tree/nvim-web-devicons' },
        { 'nvim-lua/plenary.nvim' },
        { 'echasnovski/mini.nvim', version = false },
        {
            'romgrk/barbar.nvim',
            lazy = false,
            dependencies = 'nvim-tree/nvim-web-devicons',
        },

        -- theme plugins
        {'xiyaowong/transparent.nvim'},
        { "pgdouyon/vim-yin-yang" },

        -- lsp plugins
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                -- lsp support
                {'neovim/nvim-lspconfig'},             -- required

                -- autocompletion
                {'hrsh7th/nvim-cmp'},         -- required
                {'hrsh7th/cmp-nvim-lsp'},     -- required
                {'hrsh7th/cmp-buffer'},       -- optional
                {'hrsh7th/cmp-path'},         -- optional
                {'saadparwaiz1/cmp_luasnip'}, -- optional
                {'hrsh7th/cmp-nvim-lua'},     -- optional

                -- snippets
                {'L3MON4D3/LuaSnip'},             -- required
                {'rafamadriz/friendly-snippets'},
                {'hrsh7th/cmp-vsnip'},
                {'hrsh7th/vim-vsnip'},
                {'nvim-lua/popup.nvim'},
            },
            config = function()
                local lsp = require('lsp-zero').preset({
                    name = 'minimal',
                    set_lsp_keymaps = true,
                    manage_nvim_cmp = true,
                    suggest_lsp_servers = false,
                })
                lsp.setup()
            end,
        },
        {
            'nvim-treesitter/nvim-treesitter',
            cmd = 'TSUpdate',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    ensure_installed = { "rust", "c", "cpp", "lua", "vim", "query", "devicetree", "markdown" },
                    
                    sync_install = false,
                    auto_install = true,

                    indent = {
                        enable = false, -- this will disable tree-sitter based indentation
                    },

                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                }
            end,
        },
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {
                    filters = {
                    dotfiles = false,
                    },
                    git = {
                        enable = true, -- active les icônes pour les changements git
                        ignore = false, -- affiche les dossiers et fichiers ignorés par git
                    },
                }
            end,
        },
        {
            'nvim-telescope/telescope.nvim',
            lazy = false,
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = function()
            require('telescope').setup({
              defaults = {
                file_ignore_patterns = {},
              },
              pickers = {
                find_files = {
                  find_command = { "rg", "--files", "--no-ignore", "--hidden" },  -- recherche dans les fichiers .gitignore
                }
              }
            })
          end
        },

        -- notes plugins
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {},
            dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        },

        -- games plugins
        {
            "ThePrimeagen/vim-be-good"
        },

        -- tmux plugins
        {
        "christoomey/vim-tmux-navigator",
        cmd = {
          "TmuxNavigateLeft",
          "TmuxNavigateDown",
          "TmuxNavigateUp",
          "TmuxNavigateRight",
          "TmuxNavigatePrevious",
        },
        keys = {
          { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
          { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
          { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
          { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
          { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
      },
    },
})

-- lsp setup
local lsp_zero = require('lsp-zero')

local bufnr = vim.api.nvim_get_current_buf()
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
    vim.lsp.inlay_hint.enable(true)
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
    vim.keymap.set('n', 'gw', '<cmd>Telescope diagnostics<cr>', {buffer = bufnr})
    lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

require('lspconfig').clangd.setup({
    on_attach = function(client, bufnr)
        -- disble autoformat
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
 require('lspconfig').rust_analyzer.setup({})

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }),
})

-- package mappings

-- buffer mappings
vim.keymap.set("n", "<leader>l", "<cmd>BufferNext<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>BufferPrevious<cr>")
vim.keymap.set("n", "<leader>x", "<cmd>BufferClose<cr>")
vim.keymap.set("n", "<leader>&", "<cmd>BufferGoto 1<cr>")
vim.keymap.set("n", "<leader>é", "<cmd>BufferGoto 2<cr>")
vim.keymap.set("n", "<leader>\"", "<cmd>BufferGoto 3<cr>")
vim.keymap.set("n", "<leader>'", "<cmd>BufferGoto 4<cr>")
vim.keymap.set("n", "<leader>(", "<cmd>BufferGoto 5<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>BufferGoto 6<cr>")
vim.keymap.set("n", "<leader>è", "<cmd>BufferGoto 7<cr>")
vim.keymap.set("n", "<leader>_", "<cmd>BufferGoto 8<cr>")
vim.keymap.set("n", "<leader>ç", "<cmd>BufferGoto 9<cr>")

-- telescope mappings
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>F", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>d", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set("n", "<leader>d", "<cmd>Telescope lsp_definitions<cr>")

-- nvim tree mappings
vim.keymap.set("n", "<leader>m", "<cmd>NvimTreeToggle<cr>")

-- transparency mappings
vim.keymap.set("n", "<leader>t", "<cmd>TransparentToggle<cr>")

-- buffer visibility
vim.g.barbar_visible = true

function ToggleBarbar()
    if vim.g.barbar_visible then
        vim.o.showtabline = 0
        vim.g.barbar_visible = false
    else
        vim.o.showtabline = 2
        vim.g.barbar_visible = true
    end
end

vim.keymap.set("n", "<leader>b", ToggleBarbar)


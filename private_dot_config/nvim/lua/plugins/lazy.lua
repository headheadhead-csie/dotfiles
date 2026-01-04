-- lazy.nvim
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

require("lazy").setup({
    -- vim plugins
    "tpope/vim-fugitive",
    "rbong/vim-flog",
    "tpope/vim-unimpaired",
    "sickill/vim-monokai",
    "octol/vim-cpp-enhanced-highlight",
    "agfline/c-syntax.vim",
    "vim-python/python-syntax",
    "morhetz/gruvbox",
    -- "sheerun/vim-polyglot",
    "tpope/vim-surround",
    "sainnhe/gruvbox-material",
    "justinmk/vim-syntax-extra",
    "w0ng/vim-hybrid",
    "kristijanhusak/vim-hybrid-material",
    "ARM9/arm-syntax-vim",
    "embear/vim-localvimrc",
    "tpope/vim-repeat",
    "markonm/traces.vim",
    "Asheq/close-buffers.vim",
    "mbbill/undotree",

    -- neovim plugins
    -- lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},  -- Required
            {                           -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'onsails/lspkind.nvim'},
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'L3MON4D3/LuaSnip'},         -- Required
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                bind = true,
                handler_opts = {
                    border = "rounded",
                },
                hint_enable = false,
            })
        end
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
    "nvim-lua/plenary.nvim",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            focus = true,
            auto_refresh = false,
            max_items = 100000,
            keys = {
                [ "j" ] = "next",
                [ "k" ] = "prev",
                [ "o" ] = "jump",
                [ "<cr>" ] = "jump_close",
            },
            modes = {
                lsp_references = {
                    params = {
                        include_declaration = false,
                    },
                },
                lsp_base = {
                    params = {
                        include_current = true,
                    },
                },
            },
        },
    },
    'kevinhwang91/nvim-bqf',

    -- cmp
    "lukas-reineke/cmp-under-comparator",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    "ray-x/cmp-treesitter",
    "hrsh7th/cmp-buffer",

    -- colorschemes
    "rebelot/kanagawa.nvim",
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "tiagovla/tokyodark.nvim",
    "marko-cerovac/material.nvim",
    "sam4llis/nvim-tundra",
    { "rose-pine/neovim", name = "rose-pine" },

    -- editor
    -- treesitter
    { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate"},
    {
        "hiphish/rainbow-delimiters.nvim",
        config = require("theme.rainbow-delimiters"),
    },
    "norcalli/nvim-colorizer.lua",
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        config = function()
            -- put your config here
        end,
    },
    {
        'mrjones2014/legendary.nvim',
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        -- dependencies = { 'kkharji/sqlite.lua' }
    },
    "mrjones2014/smart-splits.nvim",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "lewis6991/gitsigns.nvim",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup()
        end
    },
    {
        'smoka7/hop.nvim',
        version = "v2.5.1",
        config = function()
            require("hop").setup({})
        end,
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },


    -- marks
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "chentoast/marks.nvim",

    -- misc
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons"
    },
    'mfussenegger/nvim-dap',
    'edluffy/specs.nvim',
    'rcarriga/nvim-notify',
    'sindrets/diffview.nvim',
    'whonore/Coqtail',
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "olimorris/persisted.nvim",
        lazy = false, -- make sure the plugin is always loaded at startup
        config = function()
            require("persisted").setup({
                autoload = true,
                follow_cwd = false,
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    "klen/nvim-config-local",
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        -- version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    -- "rainbowhxch/beacon.nvim",
})
require('colorizer').setup()

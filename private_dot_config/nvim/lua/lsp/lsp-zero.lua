--[[
    Make sure you have these plugins installed:
    * neovim/nvim-lspconfig
    * williamboman/mason.nvim
    * williamboman/mason-lspconfig.nvim
    * hrsh7th/nvim-cmp
    * hrsh7th/cmp-nvim-lsp
    * L3MON4D3/LuaSnip
]]
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add borders to floating windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
)

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)
lspconfig_defaults.capabilities
                  .textDocument
                  .completion
                  .completionItem
                  .snippetSupport = false

-- This is where you enable features that only work
-- if there is a language server active in the file
function command_config(buffer)
    vim.keymap.set(
        'n', 'go',
        '<cmd>Lspsaga outline<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.keymap.set(
        'n', 'gn',
        '<cmd>Lspsaga rename<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.keymap.set(
        'n', 'gN',
        '<cmd>Lspsaga rename ++project<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
end

function use_builtin()
    vim.api.nvim_create_autocmd(
        "FileType",
        {
            pattern={"qf"},
            command=[[nnoremap <silent> <CR> <CR>:cclose<CR>]]
        }
    )
end

function use_trouble(buffer)
    vim.keymap.set(
        'n', 'gr',
        '<cmd>Trouble lsp_references<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.keymap.set(
        'n', 'gi',
        '<cmd>Trouble lsp_implementations<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.keymap.set(
        'n', 'gI',
        '<cmd>Trouble lsp_incoming_calls<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.keymap.set(
        'n', 'gO',
        '<cmd>Trouble lsp_outgoing_calls<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.cmd("hi SagaBeacon guibg=#89dceb")
end

function use_lspsaga(buffer)
    vim.keymap.set(
        'n', 'gr',
        '<cmd>Lspsaga finder<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.keymap.set(
        'n', 'gi',
        '<cmd>Lspsaga finder imp<CR>',
        { silent = true, noremap = true, buffer = buffer }
    )
    vim.cmd("hi SagaBeacon guibg=#89dceb")
end

vim.keymap.del('n', 'gO')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grn')
vim.diagnostic.config({
      virtual_text = false,
})
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'gI', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gI', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>', opts)
        vim.keymap.set('n', 'gO', '<cmd>lua vim.lsp.buf.outgoing_calls()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        command_config(event.buf)
        use_trouble(event.buf)
    end,
})

require('mason').setup({})
local cmp = require('cmp')
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({}),
})

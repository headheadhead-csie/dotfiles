local lsp = require('lsp-zero').preset({ autostart = true })

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

local lsp_on_attach = function(_, bufnr)
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = true,
    })
    command_config(bufnr)
    use_trouble(bufnr)
end

lsp.on_attach(lsp_on_attach)

vim.diagnostic.config({
      virtual_text = false,
})

-- disable function snippets
lsp.set_server_config({
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = false,
                }
            }
        }
    },
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'path', max_item_count = 10 },
        { name = 'nvim_lsp', max_item_count = 10 },
        { name = 'buffer', keyword_length = 3 },
    },
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})

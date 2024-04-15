local diffview = require("diffview")
vim.api.nvim_set_keymap(
    'n', '<leader>D',
    '<cmd>DiffviewOpen<CR>',
    { silent = true, noremap = true, }
)
diffview.setup({
    view = {
        merge_tool = {
            layout = "diff1_plain"
        },
    },
})

return function()
    vim.keymap.set(
        'n', '<leader>D',
        '<cmd> DiffviewOpen<CR>',
        { silent = true, noremap = true, buffer = true }
    )
    require("diffview").setup({
        view = {
            merge_tool = {
                layout = "diff1_plain"
            },
        }
    })
end

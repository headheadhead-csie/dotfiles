local marks = require("marks")

require("marks").setup({
    sign_priority = { lower=21, upper=22, builtin=20, bookmark=23, },
    force_write_shada = true,
})

vim.keymap.set("n", "<leader>mm", function()
    marks.mark_state:buffer_to_list("quickfixlist");
    require("trouble").toggle("quickfix");
end)

vim.keymap.set("n", "<leader>ml", function()
    marks.mark_state:global_to_list("quickfixlist");
    require("trouble").toggle("quickfix");
end)

vim.keymap.set("n", "<leader>mL", function()
    marks.mark_state:all_to_list("quickfixlist");
    require("trouble").toggle("quickfix");
end)

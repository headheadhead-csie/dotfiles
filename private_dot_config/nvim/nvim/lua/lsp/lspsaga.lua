require("lspsaga").setup({
    symbol_in_winbar = {
        enable = false,
        folder_level = 0,
    },
    rename = {
        in_select = true,
        auto_save = true,
        keys = {
            quit = "<c-c>",
            select = "x",
            exec = "<cr>",
        },
    },
    outline = {
        auto_preview = false,
        auto_close = true,
        close_after_jump = false,
        detail = false,
        layout = "normal",
        keys = {
            toggle_or_jump = "<cr>",
            jump = "o",
            quit = "q",
        },
    },
    finder = {
        max_height = 0.8,
        right_width = 0.5,
        default = "ref+imp",
        keys = {
            vsplit = "v",
            split = "s",
            tabe = "t",
            toggle_or_open = "<CR>"
        },
        layout = "float",
        silent = true,
    },
    lightbulb = {
        enable = false,
    },
    ui = {
        border = "double",
        code_action = '',
    },
    beacon = {
        frequency = 15,
    },
})
vim.api.nvim_set_hl(0, "SagaBeacon", { bg = "#7ec9d8" })

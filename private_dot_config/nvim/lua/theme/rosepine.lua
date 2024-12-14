require("rose-pine").setup({
    variant = "dawn", -- auto, main, moon, or dawn
    highlight_groups = {
        ["@variable.parameter"] = { fg = "love", bold = true },
        ["@parameter"] = { fg = "love", bold = true, },
        ["@keyword.return"] = { bold = true, },
    }
})

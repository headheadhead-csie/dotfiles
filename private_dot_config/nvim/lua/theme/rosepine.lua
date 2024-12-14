require("rose-pine").setup({
    variant = "dawn", -- auto, main, moon, or dawn
    highlight_groups = {
        ["@variable.parameter"] = { fg = "love", bold = true, italic = false },
        ["@variable"] = { italic = false },
        ["@function"] = { italic = true },
        ["@parameter"] = { fg = "love", bold = true, italic = false },
        ["@keyword.return"] = { bold = true, },
    }
})

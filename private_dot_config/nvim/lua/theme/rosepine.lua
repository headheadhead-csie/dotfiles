require("rose-pine").setup({
    variant = "dawn", -- auto, main, moon, or dawn
    highlight_groups = {
        ["@variable.parameter"] = { fg = "iris", bold = true, italic = false },
        ["@parameter"] = { fg = "iris", bold = true, italic = false },

        ["@variable"] = { italic = false },
        ["@variable.member"] = { fg = "text", italic = false },
        ["@property"] = { fg = "text", italic = false },

        ["@function"] = { italic = true },
        ["@keyword.return"] = { bold = true, },
        ["@constant.macro"] = { fg = "pine" },

        ["@constant"] = { fg = "love" },
        ["Number"] = { fg = "love" },
    }
})

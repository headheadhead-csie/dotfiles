require("kanagawa").setup({
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "#1F1F28",
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            LineNr = { bg = theme.ui.bg },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            NormalFloat = { bg = theme.ui.bg },
        }
    end
})

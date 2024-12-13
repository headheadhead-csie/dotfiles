local my_theme = "auto"
if (current_theme == "catppuccin") then
    my_theme = require("catppuccin.utils.lualine")("mocha")
    local bg_color = "#1b1b2a"
    my_theme.normal.b.bg   = bg_color
    my_theme.normal.c.bg   = bg_color
    my_theme.insert.b.bg   = bg_color
    my_theme.terminal.b.bg = bg_color
    my_theme.command.b.bg  = bg_color
    my_theme.visual.b.bg   = bg_color
    my_theme.replace.b.bg  = bg_color
elseif (current_theme == "kanagawa") then
    require("kanagawa").load("wave")
    local theme = require("kanagawa.colors").setup().theme
    my_theme = {}
    my_theme.normal = {
        a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
        b = { bg = theme.diff.change, fg = theme.syn.fun },
        c = { bg = theme.ui.bg, fg = theme.ui.fg },
    }
    my_theme.insert = {
        a = { bg = theme.diag.ok, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.diag.ok },
    }
    my_theme.command = {
        a = { bg = theme.syn.operator, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.syn.operator },
    }
    my_theme.visual = {
        a = { bg = theme.syn.keyword, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.syn.keyword },
    }
    my_theme.replace = {
        a = { bg = theme.syn.constant, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.syn.constant },
    }
    my_theme.inactive = {
        a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
        c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
    if vim.g.kanagawa_lualine_bold then
        for _, mode in pairs(my_theme) do
            mode.a.gui = "bold"
        end
    end
elseif (current_theme == "rosepine") then
    my_theme = require("rosepine.lualine.theme")
end

local function breadcrumb()
    return require("lspsaga.symbol.winbar").get_bar()
end

require('lualine').setup {
    options = {
        theme = my_theme,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {{
            breadcrumb,
            cond = function()
                return require("lspsaga.symbol.winbar").get_bar() ~= nil
            end
        }, {
            "filename",
            cond = function()
                return require("lspsaga.symbol.winbar").get_bar() == nil
            end
        }},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress', 'searchcount'},
        lualine_z = {'location'}
    },
}

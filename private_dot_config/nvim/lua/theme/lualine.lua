local my_theme = "auto"
if (current_theme == "catppuccin") then
    my_theme = require("catppuccin.utils.lualine")("mocha")
    my_theme.normal.b.bg    = "#181826"
    my_theme.insert.b.bg    = "#181826"
    my_theme.terminal.b.bg  = "#181826"
    my_theme.command.b.bg   = "#181826"
    my_theme.visual.b.bg    = "#181826"
    my_theme.replace.b.bg   = "#181826"
    my_theme.inactive.b.bg  = "#181826"
elseif (current_theme == "kanagawa") then
    my_theme = "kanagawa"
elseif (current_theme == "rose-pine") then
    my_theme = "rose-pine"
end

local function breadcrumb()
    return require("lspsaga.symbol.winbar").get_bar()
end

require('lualine').setup {
    options = {
        theme = my_theme,
    },
    sections = {
        lualine_a = {{
            'mode',
            icon = "",
        }},
        lualine_b = {
            { 'branch', icon = "" },
            'diagnostics'
        },
        lualine_c = {{
            breadcrumb,
            cond = function()
                return require("lspsaga.symbol.winbar").get_bar() ~= nil
            end,
        }, {
            "filename",
            cond = function()
                return require("lspsaga.symbol.winbar").get_bar() == nil
            end,
        }},
        lualine_x = {'filetype'},
        lualine_y = {{
            'searchcount',
            icon = '',
        }},
        lualine_z = {{
            'location',
            icon = "",
        }}
    },
}

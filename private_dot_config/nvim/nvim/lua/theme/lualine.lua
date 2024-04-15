local my_catppuccin = require("catppuccin.utils.lualine")("mocha")
local C = require("catppuccin.palettes").get_palette("mocha")
my_catppuccin.normal.b.bg = "#222234"
my_catppuccin.insert.b.bg = "#222234"
my_catppuccin.terminal.b.bg = "#222234"
my_catppuccin.command.b.bg = "#222234"
my_catppuccin.visual.b.bg = "#222234"
my_catppuccin.replace.b.bg = "#222234"
local function breadcrumb()
    return require("lspsaga.symbol.winbar").get_bar()
end

require('lualine').setup {
    options = {
        theme = my_catppuccin,
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

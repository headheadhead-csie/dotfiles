if vim.env.THEME == "light" then
    current_theme = "rose-pine"
else
    current_theme = "catppuccin"
    -- current_theme = "kanagawa"
end
require("theme.treesitter")
require("theme.catppuccin")
require("theme.lualine")
require("theme.tundra")
require("theme.kanagawa")
require("theme.rosepine")
vim.cmd.colorscheme(current_theme)
require("theme.bufferline")

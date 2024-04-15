-- colorscheme
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "bold" },
        properties = { "italic" },
        loops = { "bold" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold,italic" },
        types = {},
        operators = { "bold" },
    },
    color_overrides = {
        mocha = {
            base = "#1b1b2a",
            overlay0 = "#56596b", 
            -- surface1 = "#222539",
        }
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                -- builtin
                Folded = { fg = mocha.overlay0, bg = "#222539" },
                CursorLineNr = { fg = mocha.green, style = { "bold", "italic" } },

                -- treesitter
                ["@keyword.operator"] = { fg = mocha.sky, style = { "bold" } },
                ["@keyword.return"] = { fg = mocha.pink, style = { "bold" } },
                ["@punctuation.delimiter"] = { fg = mocha.sky, style =  { "bold" } },
                ["@punctuation.bracket"] = { fg = mocha.text },
                ["@variable.builtin"] = { fg =  mocha.maroon },
            }
        end,
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
vim.cmd.colorscheme "catppuccin"
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#89b4fa"  })

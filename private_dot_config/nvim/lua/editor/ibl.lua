local char = require("ibl.config").default_config.indent.char
require("ibl").setup({
    whitespace = {
        remove_blankline_trail = false,
    },
    indent = {
        tab_char = char,
    },
    scope = {
        enabled = false,
        -- show_start = false,
        -- show_end = false,
    }
})

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
    global_settings = {
        tabline = true,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
    },
})
-- REQUIRED
-- basic telescope configuration
vim.keymap.set("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded" }) end)
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

harpoon:extend({
    UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
    end,
})

local function index_of(items, element, config)
    local equals = config and config.equals
        or function(a, b)
            return a == b
        end
    local index = -1
    for i, item in ipairs(items) do
        if equals(element, item) then
            index = i
            break
        end
    end

    return index
end

vim.keymap.set("n", "<leader>a", function()
    local list = harpoon:list()
    local item = list.config.create_list_item(list.config)
    local Extensions = require("harpoon.extensions")
    local old_index = index_of(list.items, item, list.config)
    local index = vim.fn.tabpagenr()
    if old_index ~= index then
        list:replace_at(index)
        return list
    end
    Extensions.extensions:emit(
        Extensions.event_names.ADD,
        { list = list, item = item, idx = list._length + 1 }
    )
    return list
end)

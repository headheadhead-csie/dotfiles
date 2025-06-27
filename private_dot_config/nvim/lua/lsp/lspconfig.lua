local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--rename-file-limit",
        "10000",
        "-j",
        "24",
        "--header-insertion=never",
        "--offset-encoding=utf-8",
        "--limit-references=0",
        "--limit-results=0",
    },
})
lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            completion = {
                autoimport = {
                    enable = false
                }
            },
        }
    },
})
lspconfig.jedi_language_server.setup({ })
lspconfig.lua_ls.setup({ })
vim.lsp.set_log_level("off")
if vim.bo.filetype ~= "norg" then
    vim.api.nvim_exec_autocmds("FileType", {})
end
-- vim.lsp.set_log_level("debug")

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
}})
lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            completion = {
                autoimport = {
                    enable = false
                }
            },
        }
    }
})
lspconfig.ts_ls.setup({ })
lspconfig.jedi_language_server.setup({ })
lspconfig.lua_ls.setup({ })
vim.lsp.set_log_level("off")
-- vim.lsp.set_log_level("debug")

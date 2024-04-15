local lspconfig = require("lspconfig")
lspconfig.clangd.setup({ cmd = {
    "clangd",
    "--rename-file-limit",
    "10000",
    "-j",
    "24",
    "--header-insertion=never",
}})
lspconfig.rust_analyzer.setup({ })
lspconfig.tsserver.setup({ })
lspconfig.jedi_language_server.setup({ })
lspconfig.lua_ls.setup({ })
vim.lsp.set_log_level("off")
-- vim.lsp.set_log_level("debug")

require("mason-lspconfig").setup {
    ensure_installed = { "clangd",
        "rust_analyzer",
        "jedi_language_server",
        "lua_ls",
    },
}

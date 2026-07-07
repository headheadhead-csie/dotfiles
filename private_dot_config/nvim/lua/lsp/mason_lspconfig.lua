require("mason-lspconfig").setup {
    ensure_installed = {
        "clangd",
        "rust_analyzer",
        "pylsp",
        "yamlls",
        "lua_ls",
    },
}

vim.lsp.config("clangd", {
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
vim.lsp.config("rust_analyzer", {
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
vim.lsp.config("jedi_language_server", { })
vim.lsp.config("lua_ls", { })
vim.lsp.set_log_level("off")
vim.lsp.enable({"clangd", "rust_analyzer", "jedi_language_server", "lua_ls"})
if vim.bo.filetype ~= "norg" then
    -- vim.api.nvim_exec_autocmds("FileType", {})
end
-- vim.lsp.set_log_level("debug")

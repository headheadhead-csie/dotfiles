type_lists = { "c", "lua", "vim", "vimdoc", "query", "rust", "cpp", "python", "bash", }
require'nvim-treesitter'.install(type_lists)

vim.api.nvim_create_autocmd('FileType', {
  pattern = type_lists,
  callback = function() vim.treesitter.start() end,
})


local treesitter_langs = {
  "c",
  "cpp",
  "python",
  "rust",
  "lua",
  "vim",
  "vimdoc",
  "javascript",
  "typescript",
  "html",
  "css",
  "scss",
  "styled",
  "markdown",
  "markdown_inline",
  "latex",
  "yaml",
  "toml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(treesitter_langs)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = treesitter_langs,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
